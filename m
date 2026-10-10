Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78857CA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 21:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aFOSVe55ArlboT4cO16oFf1FAGz9Knw0x9VyoCqGZg=; b=fj/M8HcSG0eeDg0QF0MIrFP0pC
	fq7sVOtO0YQ2psAoE53hxCyurvffF9uE3+wFIt/82pnG2eHlbVqijxreZVquqEWrYp8ZLPSNfsrCm
	hs7wHULB/FI4yxW8N6gGcsQg5g+l0X7GrKU31yjizcSfoPzGNfES7yxl60WV+hBQZFMmead70GUuB
	c5w06uh9TDmRPuDnYdnbkG2PWYIAhQqs7Zo9l6gVe/+uuuPdmRLCu6DhB1Ge02vR5oRDrQ7EsjcRB
	XhPTTy+EMYLIDEELi9k3VKifPzMbeMokKMIzTtvruZ04lqV7vp3F0sfIeRfmADIa7hWV4wclupbC+
	qfBB4zIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFepA-00000008SXv-3sg1;
	Sat, 10 Oct 2026 21:41:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFep7-00000008SXV-1WMF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 21:41:48 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48c14a06c95so665178f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 14:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791668503; x=1792273303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1aFOSVe55ArlboT4cO16oFf1FAGz9Knw0x9VyoCqGZg=;
        b=aWGixsFiZDwnyaaIISp0yuofFOgUwwRN5z+t7wa4eYDl9l/c8+WHae9s5ANp8M4gPO
         Wf8vOxIUwKdCEsw5pA7/46dOtegkDocTDyTdy9GcMheaceUhRM9WZieUrJII55AfJAsb
         2MCreMJveDkTLAuF4QAJkGBHq8YSyip05EuJslclpVqtesUUoH0MucW4Bj6Na/r26T48
         qeEaU41ioi/GkF4LOL/pV//jT9LKgv6fgB5KYisiuJg8+euBwGjKrQhIqdcUJBVQRmeT
         8HWT/KnJ4exMp1FC0PwiXv2PO1mCigBqAwpL1PyuJQ+OMuhFqo6NK4N9AnAT7NiJqd2Q
         pUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791668503; x=1792273303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1aFOSVe55ArlboT4cO16oFf1FAGz9Knw0x9VyoCqGZg=;
        b=ObVjBbwJZGzhHo7w+PtkHPxAbDUvRz3tWq4+YK5HAaWIORzLzff0l7k2yW2NZRRnWY
         Y0X33R0LMzKFEYtCrQauxdJgjQ2XpttYnYf1t0RJlrsra15cPMVYhfJ1G3k8eTPYSXzW
         jfMOsluPFWJmhh8qWyuUDP9QnZRdt4a2br/OFHGvBW+1uC4G1ezeg8Ybwwf9stfdMx0B
         aEUmwkEu5WtaHKOhiMH2XTZsvGPq6/dinZYvutbVJwoSM7A36dI05T37Nv9F0BoRanlP
         DQhdk7f8IJq9ukG1HYOtV1KMqsFMBPZE3zLZr5S52Jf9o+NVltB++FP4ttBBXGTYSsWG
         oQTw==
X-Gm-Message-State: AFq9FYKso0nTTs2PaOYr8nn/jIFQjaTAGqUQtuuY3nV0boXS7BiF1b+C
	9SFzY0lheaTUfQ/Oa8AcbDD76acTY+Ej7/hNIZPQh9D3aD3+cLp8Zhev
X-Gm-Gg: AYBFou2eZntnn5youja116AfCUs5nbSaotxYAG7PczysNJghESr2V/Z8OZWnBVB8KYE
	R/kn8erowHMAxGx+071DXGBXdPpG64Wd2EFwv/6i4mxXlMmQE7WHUOXNUZ8ZdWNMzSPdjvEIS3q
	ibZud++3qjLnUAyV5Rr8l/6YYPnuXUnT7aOKQCuxWfvQcJZbizG/AsxHUl/ZTrX6E8cekpQIwkW
	JkTO+pa6nR68HBisbV48tu6Gd9b8dU81tNf0PXlYDMFvTFH83akGWcWylE4h5nndnthFO0XC00t
	MOC0+l4TjckTR14/slF8veC0kh/HnZZa8qzYdov0cm6/FNZtoUs1tOIZjniRHFLJjn7ZcBToVbw
	oB0A0yROMhg/3ajhdtNzZ1inhK/6PPjCV5VloOYE811QlTYjBSK7EcjMin04AVqo+DPcVNTnMKp
	1orE7VXD/qNcilCt7cVY2Rw88ZjogmLAHzSDgVgj4UrutzFuIF19abbme8RkyayIwbBkqdVEE+W
	8kziB6IqBcCGDWLPPM/6/4SDZnZDBn1rKv2KKeTJy1D13HrDMUOwygtLE9bLRyfZBdnY9EJOZIA
	QbF66/7Z0mh/x48Icb2vpfc6py3nx+/sBq/zejGxKp6v4jiK2GlC0r1qHFz1Cg==
X-Received: by 2002:adf:e7c5:0:b0:48c:7ee3:e07d with SMTP id ffacd0b85a97d-48dbaceedd2mr7689291f8f.52.1791668503133;
        Sat, 10 Oct 2026 14:41:43 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm10627330f8f.56.2026.10.10.14.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 14:41:41 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stefandoesinger@gmail.com,
	linux@armlinux.org.uk,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 02/24] ARM: l2c: Serialize device reads with cache maintenance when requested
Date: Sat, 10 Oct 2026 22:41:34 +0100
Message-ID: <20261010214134.1706304-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <5e78f63b-9479-49d9-8474-fa408135f325@app.fastmail.com>
References: <5e78f63b-9479-49d9-8474-fa408135f325@app.fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_144147_054095_A16CC027 
X-CRM114-Status: UNSURE (   9.94  )
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

Hi Arnd,

Thank you very much for reviewing this and pointing out arm,outer-sync-disable.

To answer your questions honestly:

1. Origin: This was developed purely through trial and error debugging on the physical ZTE ZXHN H3600 hardware. During initial bring up with the MT7915 Wifi 6 card, heavy DMA traffic caused MCU firmware timeouts and froze the PCIe bus when register reads collided with L2 maintenance. My early tests without the lock froze every time, which led me to devise this custom locking mechanism.
2. arm,outer-sync-disable: I was honestly not aware of this existing mechanism. This is my first upstream Linux SoC submission (and returning to C systems programming after many years), so I am still getting up to speed with modern kernel architecture conventions. Thank you for pointing me in the right direction and bearing with me!
3. Testing: I will test arm,outer-sync-disable on the physical router shortly and verify whether disabling outer-sync avoids the interconnect deadlock under heavy WiFi traffic. If it works, I will gladly drop patches 01, 02, and 03 completely in favor of the standard DT property.

I will report back with the hardware test results soon.

Best regards,
Navid

