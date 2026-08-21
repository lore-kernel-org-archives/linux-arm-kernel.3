Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAB7C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 07:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CkcilZDgcrif3CWjpdH7Ua82cjgdO0MXrtP14Nm7FE=; b=2WmYFDg9mHGhqQj0R0W3gR5lhc
	3W+yRm2O7HosReYsZGajqdsySlZJIQLyzBW2iZCIE+hBtlmJAhD4bpOM5YwfGG9lrcma6W9GY9TPF
	rrpxLBmoTjKL1cQlTT2LH3/0GCejg+knBpX2LYcuGhMMgc2bOGGLk8G16fD3ZqP+qrfOpH5nL9OFF
	OCeLrwe9r+lyqGrnBg7CazVv8ygWPGE3YAskipQ+xNrxLe2wJfMdnttqJo+gs/W6Qjf0cVRPGv0/j
	4kHj9E9bU7IJx0ZQ+oinu47NIJy/DjwPU4AkPlg6dp+ulPsmnALVIPoZM3Zc+QonaK5YiSJueOLyG
	bg+uP+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxK7h-0000000CkkN-07HC;
	Fri, 21 Aug 2026 07:57:09 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxK7e-0000000Ckjp-0P4w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 07:57:07 +0000
Received: by mail-pj2-x02.google.com with SMTP id 98e67ed59e1d1-3896ccc93b5so183270a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 00:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299025; x=1787903825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CkcilZDgcrif3CWjpdH7Ua82cjgdO0MXrtP14Nm7FE=;
        b=frbweeUPvPFpW398/LZHqdV9PDVNXqt6fSzJoV1/sw1eyZfFI66w4oTDYCtcBL7FK+
         SySvGp2YJkIQUS+HM5F6B29IaGwxfCbSNsjFH3FHoT2sFZKMB5B57WcZFO0LbMg83NYD
         F9BVLGX8xvscZdxL00X7lmgJJ9DfFeeyRXMTMCe8Pp4TETMiBiyOCz3JCLjziwJ6Very
         a+QWuGWwoBN9AwXruPRNycTgUpxwiifS6udmQndM9pqL45E2czZEm3bL/r/XIonXFv+H
         NDzKUPaVtF/2wT940x4/EQhvXLIo2akw4rgOMeBVVsa7GyTHNm21+gwKilLtlQUEoqv1
         qfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299025; x=1787903825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3CkcilZDgcrif3CWjpdH7Ua82cjgdO0MXrtP14Nm7FE=;
        b=Kb0T2eZZyoNKbjdhQDasok1VfP6/wjglzsSVoLbUv7YTYkPE8qod3glykOEnLQn4cC
         wsKEmoTjkL36anzaxTIBX0NAwx1ZQBLH0OblrOxrfWi6E+hIhbLbua+R2rnFaxXgquK3
         B3tqkPcz2jO2o+qI0ZE5Pyg4tbXYsvGrlm9Gy+nFQc5g5ZvwPXSk++P8SjtX5OwzuuZ1
         EuU7ICsKPoXztvgeqqY3l0GzS8NacP26Pudbez44P3dkQ/ZJNyJ0bYMvswAbloCZr5Am
         GvDUJXUDLVsBbk36ndeQc+mlpodfo3EWtImx9KBuwrsRVPe64TycByHCH6bCCkREBdPJ
         739w==
X-Forwarded-Encrypted: i=1; AHgh+RpEWfOfyXTpiOywXWwQQQhNC5Ea4yNQeIyYXUK08RZUQ3CPPWh/A1o/vHUL3PMfUQvhc/FkRZeYsursNY3drEkm@lists.infradead.org
X-Gm-Message-State: AFuF++nZ9ju09YMM01tHDfCjZRvYXCRydanCzgYnbkQrHvOJjTqr2e69
	dErt1S9S44aKsgVJlZS3RawyryPZe8oResl4zvcNIqVBt3l1SHPks+4=
X-Gm-Gg: AR+sD11M7B8Cm4ifm0+nH5krVPWdTpH9+506eYedNxKT/VBqcuVvXlJeCHsq/OXAMtm
	WxqRam1ZCj4hf+HhEmEGL6Nq0WnWCh5GxBHASar3xvO4QMKSZTFqkjfMEIQdt6fpGNRBfUz051A
	CDa3XRkJ5TEgCl7+1bX4qAGCx4AW2BeJV9Nu1DI0DH6g/0VGDgPLK8m8QNLbt9aGdx2z6A90OLc
	wqCHMcFu9/dtHFrtsFFWdq5cnoK4BS0rH3Bh5f1pjK5niPTvLoXjMi+cPX1oMoNO4p0V+r1bYzJ
	oiQnV9TDTZ5VIQhqrd4AGNFHMGiFiMeP/9w4/Pc7mSXpeoOUtlO1C1A1I7n7Q9E9YivYh4H2eVj
	aczRZ8YPQ6zb5LxdQllGzy+B5thCt4Pb2ApxoF+szJmJ0kTBx6jocV+p2HDcTuYSnFEZBZ6UDI5
	S+tcYq0ZiWfL4+AUMGLKrk59RXDfoqXUaxEn0Ee6eYHGFIg4ioCBpCRFtzxIhoyz9BTb5bpNcqo
	Q==
X-Received: by 2002:a17:90b:3d8a:b0:395:4de9:b30 with SMTP id 98e67ed59e1d1-395c353e28dmr8193141a91.5.1787299025251;
        Fri, 21 Aug 2026 00:57:05 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c467980bsm2113802a91.5.2026.08.21.00.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:57:04 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
X-Google-Original-From: Triet Hoang <triet.hoang@datalogic.com>
To: krzk@kernel.org
Cc: alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nicolas.ferre@microchip.com,
	triet.hoang.dev@gmail.com
Subject: Re: [PATCH] memory: atmel-ebi: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 14:57:01 +0700
Message-ID: <20260821075701.270239-1-triet.hoang@datalogic.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b3f3edef-917f-4bd1-a530-187877afdcfa@kernel.org>
References: <b3f3edef-917f-4bd1-a530-187877afdcfa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_005706_136630_8FFFF1CC 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

On Fri, 21 Aug 2026 09:45:34 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Stop right there, before you spam me more like here:
> 
> https://lore.kernel.org/all/?q=f%3Atriet.hoang.dev%40gmail.com
> 
> Organize your patches in patchsets targeting subsystems. ALL your patches.

Hi Krzysztof,

I am very sorry about the spam.
I did not mean to send so many separate patches.

This was due to my lack of experience with git send-email 
and with organizing patches into subsystem-based patchsets. 
Thank you for pointing this out.

I will wait for your review of the patches I have already sent 
before sending anything further.

Regards,
Triet

