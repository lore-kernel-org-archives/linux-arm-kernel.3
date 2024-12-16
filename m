Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE246E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 21:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0X/mAoqp/sXaxB7xCWI05qdv/rXkeMO6dZ+zaMAc/ww=; b=MB6NupURIhxx4atk4NeIxmR0Pq
	xFtZPj8jLLPxqwnmiDJBSOQX0/mTaNhs38WNrXNzBkKib6TWRsLRVKRhitAVszFldzZVvw4m1WLD1
	qR83IWl9XskY/5YnOBmIUY4gr8wYhUpH5q3YMXkK5t74mIzAVjKNQ5X1PNhetWRc0wCVMDs0XPBzj
	8FpDl2tD1j8EBZQSmXJvxcrMdVaK/y+sqUNb+VbDYIe649uB6yrSJIh/37k38bgk+keNHcHzIbSHM
	qaO7pICif+izsfGKIobJFfV7c4Bxki+uoAqVjbv2vlMDW2AOD7hAq/jRbsRLS0yVdVg1KNfwRuOQv
	GnOotIBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNJ3c-0000000BUsQ-2GYO;
	Mon, 16 Dec 2024 21:55:16 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNJ2W-0000000BUby-1KFL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 21:54:09 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5401e6efffcso5378366e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 13:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734386045; x=1734990845; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0X/mAoqp/sXaxB7xCWI05qdv/rXkeMO6dZ+zaMAc/ww=;
        b=Tb4iy1RVGg1TsuQqtSqusp3oM3rcjwqNv/ZxOtB2TwIEaGq1nJaFNfbgstgExYZtgy
         frqhuYiepRHVwo4fcHVK4FSG453wNRnqe+bDxoN/SLs1/84TdQxaBhKxBg4rOXT5t66T
         lpJkZlCn7YFHBXR7jkM6cnwZlNkY1KPtvIPMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734386045; x=1734990845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0X/mAoqp/sXaxB7xCWI05qdv/rXkeMO6dZ+zaMAc/ww=;
        b=a+2M+U5PkpZKZawomAnnId63n0tPn556yBj5vgcJY0fzOVph1eTggZHGYW6Tqxaqqk
         6S2aF3XffxLjd+9xLZhDdRszSBAbnobjk7Fhv4X5ZbgAUR4Fc0HoyyLHKjS0kP1jFvil
         ww+FjgFEPuNcvPXS2mnPdLGqH+kpGPjivhLtJ6+Vc0AYIvwMcbE+NHkFcWtOeFhvfS8y
         GfTzkSwrkTBelD87ZiCvEXPXM4OM9cpx/J/koaaZAdhTqztINoNRu5JMnQKhh6fThmgZ
         BRYenJIHt3eqaHRIZLYjgClDqJSe6gYqqC3Ln9AA2aD002gvWVCVLdaDCKegpGNZahsI
         3MQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1hPLd8DzJWYpU+s8Qa/WWQnfyR9QIyijK0DmmYHR2TStfyiDgvUexnocX/fxyvV/+Er0l7Y1mGlXhwmA04y/k@lists.infradead.org
X-Gm-Message-State: AOJu0YxCY/CrwHtiukeOecjJoBrJqMx0cHGq4o+uYGKvH1+9Ga8Fk9ie
	VKjEEaMpfhWIRxc8uRXEbNh8YGrGXgm9P1y0qlrS9NGsDFeJW5ROdWnKR2PvDgR3UwzT0OBUNKX
	xCA==
X-Gm-Gg: ASbGncvZmsVVOC2lar6XylXk/2wk6DE1Ge6chXwUYn9+Fwb8Vazmhykg+TGM+eDgv8m
	VPWhS9bDKu3qvQQmO84vT4572ifJO3uwchoRaBdHIy8MvIlPYL966x5pSLx9DeV74fSEQRy8kNg
	XQ1tRfQxceCvKC7AnNo3Ct4fPT8md2WTabpe7WnuSDvxjaW6JkM0jgGCdt2SrOMHX981uyGcYSw
	YtxPxHp+mFx3efaVSGX0cyrAZrT8YK31Bta6KHCeBr4DKNtSCWDW6qU3faRs8Z+LyirsXRi4XAH
	pZJD4k01vuqRW7kwP8nJgiJw
X-Google-Smtp-Source: AGHT+IHj34htcuZgOVDLsHu55V4mJrumYtQpP7ELahym/Du3aHDc+C4TKShsw1n/QBbFIp4otq+agA==
X-Received: by 2002:a05:6512:130c:b0:540:1c76:1153 with SMTP id 2adb3069b0e04-54090560c3dmr5064821e87.33.1734386044682;
        Mon, 16 Dec 2024 13:54:04 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120b9f643sm988240e87.10.2024.12.16.13.54.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 13:54:04 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30229d5b22fso49139191fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 13:54:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7bzyZaqyYZonY8sqGuNGxEfbypT75Zz/v95Ed7gHKh5OWfp9bAe6SR912wPOXbAaijyEeAZiaePTTHnpcbo54@lists.infradead.org
X-Received: by 2002:a2e:ab07:0:b0:302:3508:f4ab with SMTP id
 38308e7fff4ca-3025447d9dcmr52859421fa.21.1734386043147; Mon, 16 Dec 2024
 13:54:03 -0800 (PST)
MIME-Version: 1.0
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384@changeid>
 <l5rqbbxn6hktlcxooolkvi5n3arkht6zzhrvdjf6kis322nsup@5hsrak4cgteq>
 <CAD=FV=WQf+ig21u316WvQh0DoKsdKAmZgqPn5LB-myDXsJtXig@mail.gmail.com>
 <CAODwPW919K+XdxjUe3aPgxsv0CEWwx0P_Hxvf=VniLhk8eagkQ@mail.gmail.com> <2qx75syaojhnsqt256li6sinafml4gohohvld6uw3zhejrayuj@biiep5dvko7t>
In-Reply-To: <2qx75syaojhnsqt256li6sinafml4gohohvld6uw3zhejrayuj@biiep5dvko7t>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Dec 2024 13:53:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQhJcCNhSV7NJkdsuGjV2TVSvepdGisMU4reVUBURAzg@mail.gmail.com>
X-Gm-Features: AbW1kvafuAWb2tKHIUPH2ZldlV7L89d5SkwGUAoEp9RCWUT_FGgm1aB4MxqcSSg
Message-ID: <CAD=FV=WQhJcCNhSV7NJkdsuGjV2TVSvepdGisMU4reVUBURAzg@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: errata: Add QCOM_KRYO_5XX_GOLD to the spectre_bhb_k24_list
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Julius Werner <jwerner@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Roxana Bradescu <roxabee@google.com>, 
	bjorn.andersson@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_135408_379541_F18093A4 
X-CRM114-Status: GOOD (  12.46  )
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

Hi,

On Sat, Dec 14, 2024 at 3:39=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, Dec 13, 2024 at 05:28:55PM -0800, Julius Werner wrote:
> > > Interesting. So the Gold/Prime are actually IDing themselves as
> > > straight Cortex A77. The Silver is IDing itself the same as
> > > KRYO_4XX_SILVER. ...so in that sense there's nothing to do here for
> > > those cores.
> >
> > Should we add some comments to cputype.h to record which other
> > products are matched under the same ID?
>
> I'd say, yes.

Sure. I'll send a v3 with this tomorrow.

-Doug

