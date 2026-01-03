Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5B5FC6174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 08:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/VnPzfp1fQvhkaRYisdGLmhxps8C201lJVc83Pn+yP8=; b=NTPD3aJ5Slq/VemBWLToR3s4kd
	YdCzKqI0Cdbsn+9YTgcMSi7SBcTAhgeni3Os8RUtEkFCsWNHM5AKe9HtkuKfK3B35fn48BQH5Lbyh
	lNpbiNhhyAloPh2b8hgqszzG7C1SEgaFZNlRIL76PMTduPFBgaY/5lcaNwx9Kc0T3Ao/QZYYSqq/W
	GhJF7rIzPqOVTGjNXM8Wi6yuP7goEInYuZeHKRsluuua7QbyntPSH5t8WXUjaPhuN5QYRACiSsG8a
	0nsywxXk3BdYHV3GWrqe6nqa3CXvnO+5n7KT6eF9DIdax2qQlz3KOt0Fyk+xzi/PZGRzOlrZzbuVf
	3XtSxAcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbx41-000000096MD-3TsU;
	Sat, 03 Jan 2026 08:32:45 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbx3y-000000096LF-1fHy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 08:32:44 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a0a33d0585so116122155ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 00:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767429161; x=1768033961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/VnPzfp1fQvhkaRYisdGLmhxps8C201lJVc83Pn+yP8=;
        b=ixMlKIq4u5s5QXCt6whQiXaNFATzVDgMpLoNyC3iXwDkeZBSo/pAgJ+JpeX/Y2rNO2
         BVF/QDiZKAcxPDEzSeb1ZHVjNHC1bVGAbLEfGW4fP88JicQl4ewzrgeiDeYAyOCL8nzA
         D+rYNWupD+ucg/SxibvH+W9Wrgp6bdlOLM5HgtFVjjgctlimSHCaFM6G8lko13jlPDPy
         bBgjMH2xYKQbA+Vr2hkd+fRWUn4zdf5t23VjKUcAZyCoDSo83Ax+AnEcinEHlw0e7KDu
         ME/MDM2fAVZeYcx5PipsTTO1VTL1OObCWo6JTLi2eTOKDmOGEsJZFhvlY8dU0gQZNSWv
         yU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767429161; x=1768033961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VnPzfp1fQvhkaRYisdGLmhxps8C201lJVc83Pn+yP8=;
        b=l12e3MUGVU5mN3hiHDBiowOGcJk9TIWXsLOcFGYbhXoONogxsAVSgbvyRI3d4/6Ogo
         N1+HmLTnesMWW6RNmwKOHEfkMtB3liwyD7x28LHZNKrwbWfkvJrUTAiBz2e56pqHRda1
         cDR8O1k+Tm1nUMUzbcPkVljfkqflGGIZ9pEF/zFubNxpcXe4q3+LLdyOv+MR9Xp5ZPpr
         hoT3y1k48oGNvE5x7GJbk83HURhLttUeeREebbhGB2CJRyerevUiGEiWnO9IOsPqFFIq
         DrulqMp2kMGWf7byvetktS49bDAisMRm8Rc7U2CXYXTCDuXVfBzYfab4tACkYluEDPmO
         MdbA==
X-Forwarded-Encrypted: i=1; AJvYcCUSTIRi83QIZUUWe3VvHTGbvtCxbxNQqYhOCEBaQ5+3k98+mK6PnOZe1GbL5AEA6/PAuTfPJq66Uu9MVRky7I2C@lists.infradead.org
X-Gm-Message-State: AOJu0YwssPgPsJJTp4RRXmLSYG0+B6DKTlk92rKrmqUfKc9ScZcS9+gD
	YwUOkuRQooMcJf7TaoTCpzSah+v2sykOfCRWhFGc4alqw3JB1Gxm6XmL
X-Gm-Gg: AY/fxX4hl4K+g/8mEdiFL9fUFwm2aiKL+HSmLwPOUsjkMJovt+v7kqI4SNnD0msVCgz
	gQczTtyXvLpmUpOwnCnJUlOas0pR9FcYjLRnF460cyZT267ynr2ey7ERZfqIvVg8rof3OX1a6gx
	UgoHXIcDVZaMXDeYFpoCa6/Hep8PCp+kt/52/Ij5N1rQPLna5aYAJlJAK60y3x4MO1uBdNS05EO
	E7mno/b/cCG8+DSvz83ZhiPhYryhNt4WqvwPuWjvHF31L+mgZPy5fV+XQuTxP7hVOaFRoRWHpdK
	LIZD6YYx8iyh9Us/A8JlZSZFK9IyU1dDTpfoEf9JdhE13U51Os2uUm880UczaqQ+q2XDHhtCgSN
	cyW18CkNhKTcHS1PrX4oACXuHfNxAaePwNZAzm6o4CKsaEApXyfd5UYmN1UdHvsiA/ql585JL4Y
	Pzq+n8+w==
X-Google-Smtp-Source: AGHT+IFoulmgJlcINPNA8cZbhnmS4JTmUEE8b7brlKlIn5OURft66LBge+OGHsQgzKapPNMd4n6VcQ==
X-Received: by 2002:a17:902:c103:b0:2a0:97d2:a264 with SMTP id d9443c01a7336-2a2f2735214mr289212675ad.37.1767429161344;
        Sat, 03 Jan 2026 00:32:41 -0800 (PST)
Received: from rockpi-5b ([45.112.0.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm391700365ad.21.2026.01.03.00.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:32:40 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Yongbo Zhang <giraffesnn123@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB TYPEC CLASS)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 0/3] Typc fusb302 powerloss issue on Radxa Rock 5b
Date: Sat,  3 Jan 2026 14:01:16 +0530
Message-ID: <20260103083232.9510-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_003242_503508_A1A29AD7 
X-CRM114-Status: GOOD (  13.78  )
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

Hi All

On the Radxa Rock 5B, the system occasionally experiences intermittent
hard resets during the boot process. Initially, I suspected a power supply
issue, but further investigation points to the Type-C fusb302 module as
the cause.

Specifically, probing or reloading the fusb302 module triggers a hard reset,
which can result in immediate power loss and a reboot.

[root@rockpi-5b ~]# rmmod fusb302
[root@rockpi-5b ~]# lsmod | grep  fusb302
[root@rockpi-5b ~]# modprobe fusb302
[root@rockpi-5b ~]# [ 3389.031608][ T7143] typec_fusb302 4-0022: Initiating hard-reset, which might result in machine power-loss.
[ 3390.030444][ T7143] typec_fusb302 4-0022: Initiating hard-reset, which might result in machine power-loss.

I attempted to trace the issue using ftrace but was unable to pinpoint the
root cause. The problem appears to originate either from the I2C controller
or the PMIC reset.

I have identified a potential workaround involving the I2C SCL debounce settings
for the RK3588 and submitted a patch here:

[1] https://lore.kernel.org/all/20260103052506.6743-1-linux.amoon@gmail.com/

Please note that the submitted changes address a minor aspect but do not fully
resolve the underlying issue.

Thanks
-Anand

Anand Moon (3):
  arm64: dts: rockchip: rk3588-rock-5b-5bp-5t: Correct Type-C pin bias
    settings
  arm64: dts: rockchip: rk3588-rock-5b-5bp-5t: Fix USB host phy-supply
    on Rock 5b-5bp-5t SbC
  usb: typec: fusb302: Switch to threaded interrupt handler

 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 7 +++----
 drivers/usb/typec/tcpm/fusb302.c                        | 7 ++++---
 2 files changed, 7 insertions(+), 7 deletions(-)


base-commit: 805f9a061372164d43ddef771d7cd63e3ba6d845
-- 
2.50.1


