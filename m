Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B44F3D5ED
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 06:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CHzzXCy/D8vpeyzGmNEAYKreZGsLdIkgzez1CAccAZI=; b=weCbvEGfnlIZiAUDZU7xMcBH1C
	jUSkQenH+SwcCHTpX9TG+aT1jH7tILwVVi8VMY/sqHJfIZa5WoaPklCKHsfL5URwPZiXn2/bxbUhS
	93r7u1J+rhM1MFm4z3xmXX9/5JFXQd6UvG6pH5rCYwFq2UGbW7eFGJSHVI5VOeZeVkzFiAdRAo7IH
	t3c59ntFqEg7Bp0nlA96MEGMRVBDrXk6aFHnX/4p2tXOEkNymayi8ttXcQBcRotlJz7bE1wNr3Lsq
	js3aj6NGJYL9l4nXTYATDSnfFYDAPzUnGZM5iFBh9eIaqYv81fTlVBMpVuQPw7Ii8JJHc71r2ru6y
	eBjpsQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jXn-00000009dPM-0TKg;
	Sun, 29 Mar 2026 06:22:43 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jXj-00000009dOl-3BlO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 06:22:41 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso1424017e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 23:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765358; x=1775370158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CHzzXCy/D8vpeyzGmNEAYKreZGsLdIkgzez1CAccAZI=;
        b=sjX0BezRbl6Cpi5omxqx7ViVBZoHyH1vSNe7mdPqUbVRLaEYoNOHW74XWFb0OvZccq
         HgBnNBHbhzjjD35G/OcwquTS0jr7EwlXh7uuixmUTS7J2o3MThiEVUs8fgZKXPdjoQMk
         O67HV9dd48bx0d4zn/0pxV0isqLSwJh3YmjH3ra/XB6vgkFtY2ojHiEX/YlIZvjRMYtF
         KjzrVvtEdLmqTnHPMx9n1QiRG/4edkkMwfNLILTPIISONKhhHm5ort/C94QON1FKFFHn
         koE9fLyc++d8IET+TGupnb60NIoe/CdBFBLvDWRBjSbjC/XuGWeOp/bF7D/x5Lw3RUOH
         X97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765358; x=1775370158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHzzXCy/D8vpeyzGmNEAYKreZGsLdIkgzez1CAccAZI=;
        b=C4Gd32vLmPWnSdSzLJsPkLu/JGwFFsqy30SZInPUvZ4U16SiCmVFqHqrwmlDYLdH3P
         S4Q4ciaXrIP9pOYLUiu71xLSVVVOj07a3yfY1S94VZQ9Kl70+r0Nj2pjxEFR7VwCFWWc
         ju18euv/2tTaW6BS8kBAhofShZbVlkPIV78q9/INi4iAYYZYKIovUe0k5I4kD3Tbm2iG
         UzUd3MNdAxwEiogzSsy5COMijhxcUIi0k8OCVYWFopSBgC0dtavlAMBlodE5cGqn6Lzd
         zkW16C1lNMRNE0ptFsGkgKm5CtCCQ9bcyVCoxgyXsJ4oQoCKnsqrHk73xXrN7zs4vWJm
         9M/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9JQRNrZx19SfiQGCt2+z0UNh72Gc/VTsC5OMFTqLXh1yONojsUOoGqeAm+IT40WgZn+FdVFKIg1VsUt/yBc0w@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2VsPGq106hur0P89/g3DUw9VrfGkxUDC8hJi5SDEndSHhAFe3
	YatCqZJKZowbIazqucavtjSnD8GBiVRPz83ry+1Jvrsrs5r0uOMQOar/
X-Gm-Gg: ATEYQzx6BAtAiUI+G1kYVpdm2Zjmw7qOsNiWU6V2E+Fyz3NYrY9ygOl5ELhbHq3Bb3s
	STN63Tcxq/3yazh1yydEgadBEc9ri2i3w7dFtw6op/R+AXeehzx4nIuy00EnDwt9ZZlJW+h68Gp
	X3moEKRGXzcGfqufm2bTm9YRJ20xhkHyMvluLbbmPlAI6loYiQtH9JKfkRbJ0NgVMGVBge4uOns
	FG2T8o5kIMFiSRHsE1AbtEOGRVehQ/wrsoHQ3NLl2O8BMmpQYa84NW9odX6Yh+JFnk6YKagEaLM
	LNDd0yEhtHSRCD5cE0b0bEDQrZodz3gvky3X2o1mM9xmVafK1/KxuMsD5E6L56h4mMFv74UCIFy
	2GrWr7G4UaSKsPdPMe7DFaOA3iGiycgkM5UFgM7XEST7Narq1vFyHZppJo3dVmm0qYxzK9EL0xX
	SOkjxmqLQAcZj2l+MSwEnJHYG8
X-Received: by 2002:a05:6102:4421:b0:5ff:219b:497a with SMTP id ada2fe7eead31-604f8ff5ff7mr3209523137.3.1774765358333;
        Sat, 28 Mar 2026 23:22:38 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6db:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm4475072137.9.2026.03.28.23.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:22:37 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 0/4] staging: vc04_services: vchiq-mmal: fix multiple memory safety issues 
Date: Sun, 29 Mar 2026 00:21:10 -0600
Message-ID: <20260329062229.493430-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_232239_798385_6B925453 
X-CRM114-Status: UNSURE (   8.30  )
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

This series fixes four memory safety issues in the MMAL VCHIQ driver
which handles multimedia message passing between the ARM CPU and the
VideoCore GPU on all Raspberry Pi models.

Patch 1: OOB array access in event_to_host_cb()
Patch 2: Missing buffer size check in inline_receive()
Patch 3: Missing bounds check in port_parameter_set()
Patch 4: Integer underflow in port_parameter_get()

All four issues affect both ARM32 and ARM64 Raspberry Pi kernels.
Found through manual source code auditing.

I would like to request separate CVE assignments for each
independently exploitable vulnerability.

Reported-by: Sebastián Alba Vives <sebasjosue84@gmail.com>


