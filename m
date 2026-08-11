Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D09C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rL+1cscBL7DruRZtVhJ1GMBcU3y4ACC4gyo40QpBBnY=; b=El3tBhYj3udlw1MJQ8rbtSekR0
	5XCpnwTVMVZaJbepjqsgo3AVfUkp5pgHW48DkMwnHTBbGo3B2T3gLP9xQ71MmaUOa4t1WaP8fiwEq
	dqh+rzAOlH/2AdAy6exejahWb724YgHK8LlofhLeJYQ1h2DM314SmTRK4XPPC651xXKLOiBIgVoZV
	tuiUS04rTZFUg4sTzi96Q0ZlPqeOIVBHx+3PPpKqzdTnBPUmL0sHLa+IlBymwlCrJgAJOpnRefvkV
	nBz+hAm8HBqRJCTa5LP1DeKTMluI/yTG8FNwxlcl6k2py1Ut94Yjw0KHxLHHLt1doa0bIFxhkJMVj
	yF4XrjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtp9W-0000000ESuA-0Bfw;
	Tue, 11 Aug 2026 16:16:34 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtp9T-0000000ESt4-0Ymc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:16:32 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5aebd52488cso2063e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 09:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786464988; x=1787069788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rL+1cscBL7DruRZtVhJ1GMBcU3y4ACC4gyo40QpBBnY=;
        b=elGZ7axkbTEizaM4xCJ/GTH0pUj9qge+lPUd6t4U3y0UsmiS4Wg5CrUangEoemM84k
         d2G4KYqVwYgQZL+kEr8UEN7A3fncAznIjyN31pEfdzPwCXo62YTW3uCr4j+CmmPzHmeq
         S24fC40KtqDcmdpQTuWQoC9lUiR+sQA1On2Po1Ux6gty0aaV3sHIUFmwTRZeugyyody2
         1N33nKqbYc7PmzpRxwrNHx6qYxhr6V+yRjD8TKFGK6NrmHnGO3YORCaASAV4ube2WvxH
         r/UAlgVoUWrKnytXy3yUS31MEj2oyOheql7esUFnsjRbUPTRxkBg3Y8Aeu+basL05s2W
         V0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786464988; x=1787069788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rL+1cscBL7DruRZtVhJ1GMBcU3y4ACC4gyo40QpBBnY=;
        b=L7d3a7bqmrMsBd05/omEpytoikh7xlBRh0kUuqMDh3Muni8bolXARLaAUk4YCTlIrU
         XpezRlf0bCHJ3XLh11R7X7ROP1IcncZw++EZL9rDSJtEiIEAMEdoDMnoi8mICB9EqsS4
         X302fsuY97XSQ543OHU24DNEMR1HcMs9Fq0CdpKKnrQHvHlkDrrEeSTTPStB3DiIuPWC
         zo9UgI8Igg+/pjJJd4qLYpC0gyxf13EHpzWea25ZhZ0FPHCVKih47/9dXb1sTyLiQoWQ
         LAYqHrKHzFe42Fy1pdoTaLb7dWYUiFGrQeYgOua6uy6OslsruDEIE6SStoyRbyRdckRF
         mmoQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDX6sCEjsefSjvqWcTysCZvGJwJNIW20OQaD3EQLrj8+Il9ELENwBPOrq6pGF9pLXMx/OgTf35rpFfM+8tCVfw@lists.infradead.org
X-Gm-Message-State: AOJu0YwC42dWPue7J32+PutkwjqShcgkECvTyrS5llt+J7bpyoGMwo+6
	sp9PJ6zpEjA4HvyIQj6E5DmmqShOnDR/aN8K/FPrkVyhWv85LkY7IYM=
X-Gm-Gg: AR+sD13AcB/iKmy+hNXTY4OBQTVWiWU1Uoo1wUZ4KOBH4f61B4RLN0INLMtteq6pzYy
	WjUycM/4NZD4T/X5+fessZ0AMB9GaOKyhd1QqF1GqpyZXuJ5YT3j5KALplAtS3OwMrTDDgbjNji
	TFcZXbqaqhb1iqCkyiY7K4CnbITbKBvSLIUlGGaBTR7XIX67kDbuWi+c78tQPq8mYwLOSV3SJKx
	qLioq1RJuS16YoQtqj6IMcfxYiaiRmDKT1WGhljLi+OOvlO2AH3xNz87LZfg94FgwV2jm8uU6pf
	OPxWWqCNcL33zqJKr2ilKZRJTFvFG1DVPg6W4bTxmgrb42g9eCd4FZoUjNbSmv27cr7kbeYPcXX
	7hGUNck1k2nWsKzdMwBlPEX2MyEa3uwoTQyuRE7VOU5p3Af/bbb57dO1269kzu8LWbEO2bLbDvK
	4tNtOfufrTrCx+mWsOnxWxoALMeAl3DcCSOwyDefcfc9/wDLA8tq0=
X-Received: by 2002:a05:6512:3e28:b0:5b0:1f06:f204 with SMTP id 2adb3069b0e04-5b448649364mr752550e87.34.1786464987550;
        Tue, 11 Aug 2026 09:16:27 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4486cacbbsm377769e87.31.2026.08.11.09.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 09:16:27 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: pabeni@redhat.com,
	lorenzo@kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: airoha: npu: load the firmware without the sysfs fallback
Date: Tue, 11 Aug 2026 19:16:13 +0100
Message-ID: <20260811181613.19199-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811110253.181862-1-pabeni@redhat.com>
References: <20260811110253.181862-1-pabeni@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_091631_191182_A58C7527 
X-CRM114-Status: GOOD (  14.00  )
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

Both findings look right, thanks - v2 addresses them in the code rather
than only in the changelog.

main-1-0, the lost warning: confirmed. request_firmware_direct() sets
FW_OPT_NO_WARN, and the driver did not compensate. airoha_npu_load_firmware()
returned the code silently and airoha_npu_probe() reported a generic
"failed to run npu firmware" through dev_err_probe(), which at
-EPROBE_DEFER only stores the string as the deferred-probe reason. So the
file name reached neither the log nor the "deferred probe pending" line.

This is not hypothetical: I hit it myself building an AN7583 image that
shipped the en7581 firmware set but not an7583_npu_rv32.bin. The pending
message named nothing, and it cost me a rebuild to work out what was
missing.

Since the regression would be introduced by this patch, and the patch
carries Cc: stable, I did not want to leave it to a follow-up that stable
might not pick up. v2 reports the failure from airoha_npu_load_firmware()
through dev_err_probe() with the file name, so it lands in the deferred
probe reason and the timeout line names it. The generic report in
airoha_npu_probe() goes, since it would overwrite that reason; of the
paths it covered, devm_ioremap_resource() reports itself and the
malformed firmware-name property now does too.

main-1-1, the usermode helper: also correct, and my wording was too
narrow. "the patch does not disable it, it only keeps the driver from
falling into it" holds for the mechanism in general but not for this
driver's requests, which lose the helper route entirely, including where
it is the only one. v2 states that as a deliberate trade-off: the -ENOENT
to -EPROBE_DEFER mapping was written to wait for a filesystem, and the
sysfs helper interface has had no in-tree consumer since udev dropped
firmware loading.

v2 shortly, as a separate thread.

Thanks,
Vitaliy

