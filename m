Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A458E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 23:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ol03no2dvKfCX77dORK9oxswnoxJuMa+LnUc2hkNM0M=; b=gODEDCOmvlu2dvHquAJxn/xcKQ
	U2VGZTY018u8/qeqnttYlX701ZhxVJy0Zp/HdkFrL4wr1ROrQ+QvC5SSQZj+jY+gaUDnuudaiE23G
	KpjV+Qgt7oDvDmaJvewByeYGCqnwVVhjkjAuW9uF2jrIujh+Gd2r3NPk9jsfXbPAOb/T9T9binRpn
	UbirPPjKGttLKgouNezvNcWXj265/qburC12TvHOFlu4ZDXQHKRhSd5sWo9XEdPW0aR6f/ozKIrMt
	/2N5Ysj1XBPETIXCzdX6aNumJVrPv2G58fswAwsLTFcXdrddPMLr1MMWpy/hkgm2w5FePm9d/T3Z9
	7cXwTflg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnIX-00000009amW-3ZHj;
	Mon, 09 Dec 2024 23:36:17 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnHV-00000009acH-17EZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 23:35:14 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4674a47b7e4so18801cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 15:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733787311; x=1734392111; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ol03no2dvKfCX77dORK9oxswnoxJuMa+LnUc2hkNM0M=;
        b=gP47dKmVONV5DLd0E+FB85BaySpZc0/sJF43cAJdafKfcaLERxX7p/b9Sl2/4kTHt7
         6zy8GB7KggasNuGT2CyDhtagyd6zkvVH2EoQMORBYiLV/jKMe8taUzY4jvLrE6Zq8Rk3
         A6QTAF+dw2D0aLSGBP8gvlspu2xZCzAxKdE/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733787311; x=1734392111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ol03no2dvKfCX77dORK9oxswnoxJuMa+LnUc2hkNM0M=;
        b=pFnGMhfaNPVP80Cz1vmzmgVFPJhKMVWcEu5ZhiAx3TlGO4otZSYQBcnv4w1rWXkbHJ
         nlfwYsxbB0iINbsAQrf7vES4qc+dkHIIO1AVXzYkvtD6SyHejJ+Yb4q+BHWqQd/a/9Vf
         VHutRgrJ+5YajfSVpMT5p3m/rgbamdSYmHPteRdaQGjzM4/1dvfJJBqHehag4g6Ax6pH
         luNfqitZpcNA55kAi7aae4fLAzAzpORJMHPTVo2ywdbN1EMswd4qcTZsAXTFeXXtsSdQ
         kaNpQKnRiRc2dcPWfIM3MeM1ZRo72AMl+Rd4yX+HjxkBqIITRPiBSm2Ao4h0zmXCzBcK
         VSKA==
X-Forwarded-Encrypted: i=1; AJvYcCVl5PTkdMGwGyC7kOQ3levUDEN/evcU+H8sNdukyNGSpdbI77fWnWISMaE2eloL3rek637I5MWPyTLrlWyikMcA@lists.infradead.org
X-Gm-Message-State: AOJu0YwmriOME5YW0LEAuwyLrHdySRdClJ8E05XqA3KJGeprz0nC4CY7
	+YstVdjBQQGpXqhzbWK4xNG7+J99FESHxLObhFXewF2s+JQGGpVgQrHCB8wbmLohv69brAwgf6l
	jFKzESm82zrD6i3SQbpYUxzoq2Eozc5d+paqh
X-Gm-Gg: ASbGncuavTtHST1Evvh5u5xLHnmCq6X6N2TE2yOFyL6yxVipQ7QrOSxVAp2VkfPvw2I
	v3yTtqfTs8GEqZBD36S59OKfGQVL3SlwW
X-Google-Smtp-Source: AGHT+IG6vBSDnyo8DnXzx5kPzDIJg4/9NRCPEUWYVmSZGIix1BOzyQgBNO2RxNpvwUriTGNn5xGsd58zCPlKbjcYd9k=
X-Received: by 2002:a05:622a:4ccd:b0:466:a3bf:41ab with SMTP id
 d75a77b69052e-46777683c7bmr441641cf.21.1733787311096; Mon, 09 Dec 2024
 15:35:11 -0800 (PST)
MIME-Version: 1.0
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.2.Ia3dfc0afadbfbee81bb2efb0672262470973dd08@changeid> <wx6qbdbcrvbq34snzkxawlbpxm6vogt5ccjmdqqyazukfbjy7t@qkvax7tr27bs>
In-Reply-To: <wx6qbdbcrvbq34snzkxawlbpxm6vogt5ccjmdqqyazukfbjy7t@qkvax7tr27bs>
From: Julius Werner <jwerner@chromium.org>
Date: Mon, 9 Dec 2024 15:34:59 -0800
Message-ID: <CAODwPW8mq-saJuTYnMhA6bCopcjQwBxEoyWhQB60Jg1m7wUZkw@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: errata: Add QCOM_KRYO_2XX_GOLD to the spectre_bhb_firmware_mitigated_list
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Julius Werner <jwerner@chromium.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_153513_333329_03953AA1 
X-CRM114-Status: GOOD (  14.85  )
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

> > NOTE: presumably this patch won't actually do much on its own because
> > (I believe) it requires a firmware update to go with it.
>
> Why? is_spectre_bhb_fw_affected() returns true if (cpu in list OR fw
> mitigated)

That affects reporting, but the mitigation works by making an
ARM_SMCCC_ARCH_WORKAROUND_3 Secure Monitor Call to firmware, and that
only works if that call is implemented in firmware. Trusted-Firmware-A
is currently the only open source firmware I'm aware of that
implements this call, and it only supports Kryo 4 and 6 upstream (not
2 or 3).

So in order for this patch to actually be able to do anything other
than report that the mitigation is missing, it would need to run on
devices that either use a downstream fork of TF-A with added Kryo 2/3
support (I doubt this exists because AFAIK Kryo 4 was Qualcomm's first
attempt to use TF-A) or use some other proprietary kind of Secure
Monitor firmware that has this SMC and mitigation implemented
separately. (It seems unlikely that Qualcomm did this in their QTEE
firmware, since if they had they would have probably also added the
MIDRs here to Linux to activate it.)

