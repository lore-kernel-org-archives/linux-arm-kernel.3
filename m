Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81427C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 07:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cheEarIyKVJUARXwRvLdgflVQA3knWwTd0Aeo5HkwRs=; b=e0ElBJuhrec7WFsZJ1DOLCbvZb
	mBfbH2+Aw9qr2wwsH1bcaYXC5z6LcGj5gSlHsg6RfbpqMSnr6lTY/1fKRkiViquqzXbvcQEbMYhmX
	Thrh4Zl/sg//WfvJkJnhMkH7WZnQ2FGSluozZwHL7LOG1EgvY/St/zT7ySB98JhM45YrBb8cwO1Y+
	J8PvUbH1BW5A+fM3EBWErtpRoWPEszO46eFcKVXnr1mZTXhqHAhPqjMCjiEx8YMbRVT+W6+B25xQH
	2iKlb3uCmN4cwl3PYLFOQ1LpP4R53IWFZTyulYtPRl4XEEncdXIfYPHt1p3LkzvU6s3JWvK5Zphjm
	vApNjIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4Ya-00000003h3F-414s;
	Mon, 16 Jun 2025 07:47:05 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4JE-00000003eRn-3KWg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 07:31:13 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-313eeb77b1fso1866885a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 00:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750059072; x=1750663872; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cheEarIyKVJUARXwRvLdgflVQA3knWwTd0Aeo5HkwRs=;
        b=kkIDfcyGGr9H1eOQgzWItH08mM+yT1eSRlH1tn1hxrc2dJ+v1/rPv65PXX+wKLyKjh
         v8OiMr+qHza4+wqlZdGbpWLqu8SzpvQiIAexj2krEz8pbAzouAj7dQHslHTkcVWKaSa4
         GRC7aICS/Qe0GveRQHV/YgucKkNPpsn9xDheNTQ9bnP5PTV/AtXDWOXRMlsix0xzzgnN
         kxsSd39kipVy96ZKBn9lWLlXd8TFbsNYYkMAFCw7+5frkBYoNWchmTmT8ufDc7eDydfd
         h0Yb7Aqqtd7OATH3XZ/Z8/mmcRTBtg1nL1dApVn6PimxNlDha6yHVzbY5dqN8IGp5YXm
         1kBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059072; x=1750663872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cheEarIyKVJUARXwRvLdgflVQA3knWwTd0Aeo5HkwRs=;
        b=ubV8tUfkdTpo0cnDxCQjJl7wlmgxxGULLOfebp4HFuJpPZHjKJ3NWXSSil2VFMFXQg
         Vfb7GRYZkYmed100Z2Ma6/xDqKYh4eCSW/F1up+CKb9e9iH99ym/aBEc+l9ED4dnBgsD
         xX7R4npJE9JyKq/9sJ7Du8apALmXIte1P/EG3p8Cq+bwjkDMGbsx1zT3WivpKMQo6hAP
         o4PpJOc36W6+1W+ocetYI5MSA+/b1nR39tvuw3kKfWAW78vy7+pqODLXqoWiF0p9ud4d
         IoG52lIcwhJLg/wqjoMTC2tF60K2GmOxOSOwMp/gf2adddCM53WjntKwL7XXCWaWSbTk
         khSA==
X-Forwarded-Encrypted: i=1; AJvYcCVlC3DclsYt4KwRKms2XAMnYAESIGMy4GxpJR3cp8w0QFUuJHC4zT3icah2Gy1h3abRrzaj/s94UQcK6N3im6xi@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc1NQ7MDacO5QRaxl/y5PWj/6nqNdOwarih9M0qKWwebeMH/Ma
	f9YAaVkbpvJFTAEHlic98os90xa22KK8Pz9pdtRa+tPanbVV2zfb88d1bXulnO2gpjBRDGhn+nA
	RhM0hg4agPgrqedofFlETV/4auVMJF8gXkpAo
X-Gm-Gg: ASbGncswOofaKGzblsv93WlgjsJqT8zVbjcmAHCih1TkxWNtHd7MKFOjrn7WJNGWZgb
	zHZ57Pr/A1fl6CL6S9cIvg6ZYVKnUrCf14reLJT/5WGFL5DJAMwq/fOgoKRGqKoOogYkPN2OOmn
	n0HE2h4BWqwmkwc/f9hrKUyYzinP1rC18dDRyCkDSM
X-Google-Smtp-Source: AGHT+IFAqYUd3QpiI+ATQMIggtddyd5pZ5byJDm+wKZp9c0vvh4+WvPZLenvvopWZ+I4insDVZLiVfMwAJbeqfnmCkc=
X-Received: by 2002:a17:90a:c107:b0:311:fc8b:31b5 with SMTP id
 98e67ed59e1d1-313f1ca1398mr15200699a91.14.1750059071687; Mon, 16 Jun 2025
 00:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250613194310.1128733-1-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250613194310.1128733-1-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 16 Jun 2025 10:33:13 +0300
X-Gm-Features: AX0GCFtn0hwbvtz7t5if-ZTv1RrgsBJVVoHPdrySbGFc57a2cboCkTDRMjfm2ao
Message-ID: <CAEnQRZBHF4dwTEcaz2VQE9UYCu9aVapV4fuRtTXhvBdDDkZDWg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: imx8: add core shutdown operation for imx8/imx8x
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_003112_835725_1D067CC2 
X-CRM114-Status: GOOD (  13.31  )
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

On Fri, Jun 13, 2025 at 10:43=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Currently, the DSP core from i.MX8QM/i.MX8QXP is able to operate while th=
e
> firmware image is being loaded. Because of this, the DSP may change the
> content of the firmware data just after it was loaded, thus leading to th=
e
> data having unexpected values when the DSP is reset (via run()).
>
> Fix this by implementing the core_shutdown() operation that will put the
> DSP in stall during suspend(). The stall will be removed during the run()
> opertion, thus guaranteeing that the DSP core will not be able to run
> while the firmware image is being loaded.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

