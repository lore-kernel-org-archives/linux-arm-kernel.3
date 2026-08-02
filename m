Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76955C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 09:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZV8ynflEO4JQkppwv0nIitNDbgzI01paOOgnqEbB/0=; b=04Z1txf5sGvPV6b2Omm8D3huc8
	PdnzMtCS5mWs59qqzrvTbOdQegfXXf9+uV+f7qIPpUEXsPbuBnUTYCdSeLfWTj5sGT57YwGw+BPP8
	oQwg/faVgiqVLtrdjt3QGBP7u0wHe40NwDCn78bT8A4m3tMb633gSNpwArFyxvqsS3jcoDRmtBBz2
	BOqOFjUrKgk9dp7oEhrF34kcmmQ8pflV96IT2qvkI2b00owxZTF0L72YtP9LQTlTV/1PlIw9j02J8
	PC+XmA+mCOpMIzNYd7sPFXimzGDUfDBM++Tyud4+MVRgRsBpmNtGQ4H+b1FSLGZwvoru5dw0b/YSL
	kYHDCgjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqSI5-0000000FVeU-1XGp;
	Sun, 02 Aug 2026 09:15:29 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqSI1-0000000FVdw-3J1z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 09:15:27 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-45171f2f608so1421743fac.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 02:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785662124; cv=none;
        d=google.com; s=arc-20260327;
        b=Dwko9+6dTbkEZRaaNqa687MMPHy8HIOCdMRf5udSA1cz6+agWkUs5Oi3k380Wyz+3y
         EuOnRnjLnSmokaYd40sfrZPy0ONXuN4+Vexd+mAX4MEuuHLOrC/mDPWAm5ozhGWzcmaQ
         acW+xEdnJIBOMMjL4MXvw6o6e9IcThMHsJfwM2qm182fVGghUBB/0fJ0vs/uWgIhHw5m
         eYA/8xlbZvihqaVVukrJqQnR1qNWfI6g06nEhzSDxwyJnlggP7BJp5blw+Ttp/IKFP+9
         jhxrWTfsH34C7+5V4vy15Ja3Cj8yg/8b/veQWb7kdeRXPpWe3rwEPTw99bKrkzhfxMOb
         SRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QZV8ynflEO4JQkppwv0nIitNDbgzI01paOOgnqEbB/0=;
        fh=HTfZYth+G33sWU0fYJ5xu05dU9cs1im7JcvHXAEW2Co=;
        b=A+wa+NtmrIoZMt/fJYdAPM2Zzr4SZg44fQAe36yRrTcL6P+41jWK12ROUuhu3qIGMR
         ySiBCr2j+gsQEeOVIqq+8VAFvoqcRlQ8i7HaDFc+jscDoW3JBIHlJ4xh3imRxyny0ZHH
         s1WhEoQXV9VgwzR4mFOpc48EUYnVU64lDv578rsuCYhOdt1k/lW34aM3escSzMRoDA5A
         EHH++Zvja7QELms0DH8xW08sP3jXpZNTNhM9iTujdAStQMD8ysdCKRqp4Byadpt3YQ9u
         IS//VNcInptBFb+PtRk5zZ1UNQbKs9YsJ4ZIOlMQSkuf9hTSk6TzYICg7FJO2TUP2NvQ
         HV0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785662124; x=1786266924; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZV8ynflEO4JQkppwv0nIitNDbgzI01paOOgnqEbB/0=;
        b=hnO0ZxukXJL7+yEry3QsJXrTsnNSBU4QOeqs+NNYt9LA6x+SwoBrvneCwdKeayyip/
         rcu+btMn6FdHkAuLGeUQFZu1sXzem9DLy+qKg/caKbEtznNgrn/6DoK/c+jonaxYb4QR
         wXRgwSbBzzSvHLxYc8rVPgN03MhNq2hv6W3jXCT9OepKp6//AGgRxCDoBwf2/gs8Ltcx
         QXVhFuk0T4+4yWkG65Nc2APWGlUi2kyx7Rc6ZJscgj8uOfzfJza0iZybsYwn7KuNQrjJ
         qDqe86xVW9IgQhi3pv/mLO2cQd2sg7464OCUQR+kyR4r/+U6d0j+70SYfpPoMBK7NMdO
         q9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785662124; x=1786266924;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QZV8ynflEO4JQkppwv0nIitNDbgzI01paOOgnqEbB/0=;
        b=eLKpXySqRzaYJr0EMLjxMy50qdFaOOL2vzrSeoTB4wg1QDLDa0hP8JoJTfoZSQMxLX
         1LS1XqYVyU3wwdrvU2LJ1KPyVam3+LP11BEj3BwiBWQoiMyG4lgnoHadd1Wv1c/cQhlR
         a7zxEoYVYJrOKC02ecQjjY1wlQAGr4aBjspG0Uip9HGltNuMA++rap6ZKV2yQHYzUpcy
         nNfaKAbocKOLXI3bgG5TVBWPjM92MSPcatJmmIwDY6o34psYyEVgMJCYS5pAUjyvfCpx
         7X9O5aartBHB4shMzovBDjtWIdVTTh3gsnk41odUWS6Qf6h46SwASpoXioS7w62F9sLy
         c/XQ==
X-Forwarded-Encrypted: i=1; AHgh+RobxzNxx1gPupFAv/+zFmZTWIXV0uBmFjDKp357HUgSCyBPJTxmORzBaCTsXpICgw+L1/ELzphccHFCuj3AiqR9@lists.infradead.org
X-Gm-Message-State: AOJu0YxEBX6EiIn+0yrHSK9BYDrTp75ZyJldZfGvKEfiTByjzpQ0EBfJ
	tCHqZgncSEwXZSa2lQFTmxw63shVr2kmAPV6aVDPE4AOXjxI/4P21JhQMAAU++S5HpI1jN5edII
	dgi+wNIC3OGOhCZMY6UHCiznyOssfWsQ=
X-Gm-Gg: AR+sD13bPbwd5S/L1FkTEYuvYXYZ8TjtvugVS3PKED8UN+j8UbMzoUOWUqjCBb2td/T
	3+lmdxDYx31wMpS04A2QdPQ5vmal71I4BtKfTpk1cHWC2mmNhBy9IRe40NOQ/GVxDBfeeHUxkWz
	GEXxGF25t0VbRJciZPvoEkE1B74oTUQBWnvXHXcZ2O7RMk6ksjXVxZoRQD7AM3cMcu6FzN/gpqr
	qAjCM5hL2NT7W5LwXkUIP91+F8AlefkdenGicP7wFFDfWtRcvCaifCkyrEpLcGpqjLRLIAa1h24
	RN8gp0TyAvCVLRPbyMUOaV4NjraQFYeZ/lE/YKhKEGI9URVKmbuzIVYahA==
X-Received: by 2002:a05:6871:6005:b0:455:9a0a:f40f with SMTP id
 586e51a60fabf-45905d32498mr9874666fac.12.1785662124236; Sun, 02 Aug 2026
 02:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com>
 <CAAQKjZN12OSBg+ch+xf+-uO6_Sbrtq-o8AkLdLA3mFQ_ubiLxA@mail.gmail.com>
 <CAJpoHp48cXPLrwvANAt_-D-jE=DcSyodAL=p36kQw3cGtQW_fw@mail.gmail.com> <CAAQKjZM5cY8V_YaZzgF734Brabz=zwRkp2k-+b9CbqS2_Xvi2A@mail.gmail.com>
In-Reply-To: <CAAQKjZM5cY8V_YaZzgF734Brabz=zwRkp2k-+b9CbqS2_Xvi2A@mail.gmail.com>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 2 Aug 2026 11:15:13 +0200
X-Gm-Features: AUfX_mz1aNx58MfilAVRqksW7MpjeaHqifC8P2ZXRQ0TR5zNx84ocL2q9Pi4X1A
Message-ID: <CAJpoHp69qLrMKJvhktAtZBdLuh-fDQvmPYvae2YDsua2EBDZUQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/exynos: DRM encoder improvements for Exynos devices
To: Inki Dae <daeinki@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_021525_862572_94E407F3 
X-CRM114-Status: UNSURE (   7.45  )
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

Hey Inki,

> Both are trivial, so no need to resend - I will fix them up myself
> while applying the patch.

Thanks for the hints and the help!

Best regards,
Diogo

