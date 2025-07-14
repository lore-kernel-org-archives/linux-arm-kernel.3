Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A972DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 20:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5y/8SUZq0rdm2xQZuA/Ya2xOqAO/MdvVu8D3Jo9BDM=; b=U8nj/ZLMM5YOGm7R1CcLxbv6vv
	h2mJXiYqF8pDZuLfjHC/1DETS8Q4zYBrCL2LsosPjyOgsVFgog8jfLEQhCA/7m+LABDCqJ9rihdaD
	zYWuDMUWBxkRC/a54PYJAOYgY+I4m71ifM9ZH6dW7hfUy1Fr29eXVMg6BlkieqOxGUNC/NmiCCtDf
	AlQDLLAu9AV0aX+ATrNXEZzmhrQ1OjXC1HacQe7+8ZqZPfCpmFhl44qpF2Dv7HOGVQsdykbfW5onP
	9FaJfu6mOaFKoAUzJPGvXSf6nL76JMFpU38q1i1yZl3KLh9dyWleFwUOZ9iFODewmex3CnF4ZUvhc
	Us5s62bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubQ0C-00000003El3-2SQN;
	Mon, 14 Jul 2025 20:42:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubPxl-00000003EaW-1iGp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 20:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752525587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a5y/8SUZq0rdm2xQZuA/Ya2xOqAO/MdvVu8D3Jo9BDM=;
	b=OzNlYLIdYDAd8+9cjindWi/I+J+Q+UVaSYovlrT63RkOpWVx1JSTJ51GCQnvweDh1+5Q+1
	W2F7BE0Z4RLdiimV6fXqhyVbGHhvLiS0+JSWj2G4mu6+EAWMwpSFc7U6M32/DlO5vcPbRz
	eESzXrJMUtKMQ/UTZgLlX3BqrvjRLv0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-1ImZDsUIOCCKrK5lfY6XkA-1; Mon, 14 Jul 2025 16:39:43 -0400
X-MC-Unique: 1ImZDsUIOCCKrK5lfY6XkA-1
X-Mimecast-MFC-AGG-ID: 1ImZDsUIOCCKrK5lfY6XkA_1752525583
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ae70ebad856so208433766b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 13:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752525582; x=1753130382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5y/8SUZq0rdm2xQZuA/Ya2xOqAO/MdvVu8D3Jo9BDM=;
        b=UQ9qW1gEUvlni+MH46Y9ut65APG/9HDZGshCFO3RX0+irp6GaOvPFt2MXzpDMVYPOd
         0pTXcByd1r7GQbLh+AC0a2FfPx4w6yEUCqIdFuAfT+0SoJX1vFr4KtLcFt4MZEJPCiWy
         quM4Wb581jM+fCTQIQv28M9RRMHRUGB2YYc1Uc3DCYLaC/tQsjiga338VNpxDILIGWri
         NOY3y7GSvCgZ1TG/UV1/EPQzzMudeG9fBBQP3nwBTolsGe0csNKYv9l8zY/MV/DkRWwZ
         g9tiCZvrm7LKWV9tgMBdJQRXDgeypA3UXHiXmFYsSi+8Ut7bL1KwQHy8LgkktnTlnjEW
         GJ2A==
X-Forwarded-Encrypted: i=1; AJvYcCVHSSMtu3/Xo0e2fqhASqHyhwrtKEqH6bm3FfmDeAddOyStk2xGg/4vnRI1y25qD1yGsD+x3TUsuDov1DYSW2Fn@lists.infradead.org
X-Gm-Message-State: AOJu0YwNekS8TtwtPaVWQVi0Rzcux0Ns5t1ecD9O259ZCdFyO05khlI8
	bX9Xjw2NI+XE1MR6RV8qAETcS97xRsWSNT7UoXrxTNEyHwibz7rzUw0w6JSLk+6zbHxLEkW9+aY
	J0HSljXCd6FX0H7wxgW63UXs8sjzpRzjPh0eRnQaHITvoIYFboRbBwgKLcn/9G68FagJpDAbKMr
	eh1aE+NKu4k0Pt15N6oD/Dn+7DK6R0/O4o916N2ANhbSFgtHzVY+s=
X-Gm-Gg: ASbGnctM08ycAIQXXq7Zpu6CRbFyi7wAd1x7T0tZ05THN6885aylTKX9VYg1SBXeYaC
	JYPJ9xHt6+MFc0a1DXIGTIkZo7xn4udr+XelPzWg86VXOwz/b/2KajlZqodN50Oimft8ONhmJlG
	BnmwQqyKrTSeAHl8699sFz
X-Received: by 2002:a17:907:84a:b0:ae3:a240:7ad2 with SMTP id a640c23a62f3a-ae6fc6aa6dcmr1561811566b.2.1752525582621;
        Mon, 14 Jul 2025 13:39:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtOtCIDm5iIRXUzH93pKL+mJg2YxukWxSYyuAjAlCNSpCWGK9PKhS/khXgGAJEgay188lilBak/nz6CZiqGvQ=
X-Received: by 2002:a17:907:84a:b0:ae3:a240:7ad2 with SMTP id
 a640c23a62f3a-ae6fc6aa6dcmr1561809066b.2.1752525582243; Mon, 14 Jul 2025
 13:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
 <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com> <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
In-Reply-To: <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 14 Jul 2025 16:39:31 -0400
X-Gm-Features: Ac12FXxNfqVieUoHNPgnW-EodFqKMjypw83pf906bEoCpdOuQyrxKsmWcymmig0
Message-ID: <CABx5tqJzEMUXz0Cbo5siCnwKp2MVON_oGgMnGkb_cg1zv8k5nw@mail.gmail.com>
Subject: Re: [PATCH 4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert
 from round_rate() to determine_rate()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ewf1elRnQtA2KOZfvPSYwjBpGXrEbzkK2KUKTvAG7V8_1752525583
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_133949_533152_13B0F103 
X-CRM114-Status: GOOD (  15.64  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Konrad,

On Thu, Jul 10, 2025 at 12:09=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 7/10/25 5:51 PM, Brian Masney wrote:
> > The round_rate() clk ops is deprecated, so migrate this driver from
> > round_rate() to determine_rate() using the Coccinelle semantic patch
> > on the cover letter of this series.
> >
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> come to think of it, there are a lot of drivers that can not
> do any rate rounding - perhaps we could introduce a NOP implementation
> in the clk core that we could reference, instead of copypasting
> int foo(...) { "return 0" }?

I'll look at that for a second round of cleanup once all of the
round_rates have been removed from the tree. From what I recall about
the ~200 or so round_rate implementations in the kernel tree, there
were maybe only 5 or so that cover this noop case. QC seemed to have
the most from what I recall.

It wouldn't be hard to make a Coccinelle script to look for the noop
determine_rate() implementations.

Brian


