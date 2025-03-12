Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCC8C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 16:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fDo1mOrvYsr1Wor/NfjNciCcvytoLzSX/OlLcDkL+Vk=; b=yNwqDLvpuG1mMjcfYK6qQqyLv4
	BRDxS9XC97i/hy+JrMXmsD8m8MReReSsZWZjzUkysY8Jivx1nU+MjsbZKD+Z3ISZiKZk5PR/8EyZf
	PCfIir6BJJzMiLGFHp6KuDd+WLzHoj8sdtP8xJHS0ZKQQpt6JT/c2mfHf6kpTDa7jyFQajO9bls3d
	xjMKgYwaPNZCsKNjkMakE4UvLHGUgU0zsRPzI5zh13sjKYUegyfu+NK3G8h+7Pp8WNY61nl9uf9mO
	EsPCizg/PzHdLHova2MFDXsIJD4XJ6EcBl8LDs6BzI1v+1ZKVS5m5WiXW4xd5NM9CgTx7wLNyu1+W
	tsCN9Zjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsPBc-000000093ZN-22qD;
	Wed, 12 Mar 2025 16:44:04 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsP9x-000000093P7-0tXN;
	Wed, 12 Mar 2025 16:42:22 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2240d930f13so108145ad.3;
        Wed, 12 Mar 2025 09:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741797740; x=1742402540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fDo1mOrvYsr1Wor/NfjNciCcvytoLzSX/OlLcDkL+Vk=;
        b=ZJgUCrBDxeq7+mbOiwSqmtJGmJKXFUEORC5Qeh0/eL7SIY7FcJlxN83yOSWYhyoETe
         qzXLiBIigMdAbxeo0imkYJS1FaXLwoW9Hqga0/wjTHRwm87PhSBXsUPyK30i5GvI2II4
         at2ZZxcpNRvEYqnqSI72O/cV8Z7TzI6vpMOzHVe/9Uhej4iGOr3CXTb9W+WfD5lzb+Fx
         FZ7Ywnlx05R+yEAh9zD5Rg/vuKmfluD7ohXdQg5ciRaWBWCC0hxg8hG44gmFQf4qYa38
         FT+3OCeU+25q4W7m5ifnYHMOli76vXfgzwGKaDSogXUHcHqDDdNV+sDVJUy9QKxRXFdK
         XRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741797740; x=1742402540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDo1mOrvYsr1Wor/NfjNciCcvytoLzSX/OlLcDkL+Vk=;
        b=CaEMR8TpXWhcnK7Qfo5G0czLKyfKGLA7irA3ik1YMWo92umTHjx6CfNmUj8F72qteg
         F58bbXdkP92ch4N+8qSsIc8ZkvwlJ31amxr3JSHOFithxTrWuNoyTjwse1CIGbcwSF9m
         6oRGlGVWzCeup9YE7Qkfz2QZ1emUMZlzm1qGimBbdBSdjPNsZ5ILJ37fkdS/KUwS1vjD
         09fbzIKGrWZv9rEnhCmt66VmwcDV44YffBUKgKuKSaBAV8I0mD/J6mL+k67FiGkO3Syp
         kQ1ry6jDE6Bbk0UYhn6fJpgzJ4u9fCBlM3px1sXdmbDGmlGcZKVtXj3WAXwRKcpNx0eH
         6ifg==
X-Forwarded-Encrypted: i=1; AJvYcCWmheNKtQuDSqypUlxI5+TZJluQCABORecq8MlI0BI6Fj3zeuEsKJg1VJKJc2eMblWD/vvzg53qzXFxw/NLh0Jl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6LJRqSZxEPYsEYHmouawfnrN2ZQq1yacusaOtv3m/MsjxHgoQ
	MSTHI0QgQoD4bar2jlgxXiUPLl2Ik2sPKvIdjy1NDtdVlffuFjDxU8bio7DS
X-Gm-Gg: ASbGnct6q9jqd4HH43/re2LTWvetKsNs9Ig7QReL1aqAgz1AWq0AIq2x8tE+QU5ztat
	7bN7p0x7K3cMHCK9wpKQ0hY1NtCKI7hg6EMJjWi7fTengq9zXjaiH7OCV0EqMjyROAG/cFODANu
	7IM/5y1CfiWRWjsFBWOoTkjvSloTwDA6sjpzIsoCY0wgnVy7zcWnLYzYSuhH+uZ8Uf8klk5QjfU
	V4xT4AfXmGV4GuomNlh05A4d1Fb46KOnQjwEF4cO5F9qsM/RifrrzmlCsFk7xoJF8S9TKVRgUiP
	aZIzIe6AhnNdIn8+LHtrfroOlHWj+NATS9VML4WfjiYUsw==
X-Google-Smtp-Source: AGHT+IFm0JEzBi7UsabiIcrQjLIM22yD0b/DK/hkrICcjfxMd5Mxwm9emaajvbKq2S2Z2DtdbFKo3g==
X-Received: by 2002:a17:902:eccc:b0:215:a96d:ec36 with SMTP id d9443c01a7336-2259326cb9bmr44059855ad.5.1741797739771;
        Wed, 12 Mar 2025 09:42:19 -0700 (PDT)
Received: from rock-5b.. ([45.32.55.39])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af28126e281sm11574509a12.47.2025.03.12.09.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 09:42:19 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Enable HDMI audio output for ArmSoM Sige7
Date: Thu, 13 Mar 2025 00:40:49 +0800
Message-ID: <20250312164056.3998224-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_094221_252884_8DD8F7FA 
X-CRM114-Status: GOOD (  10.14  )
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

HDMI audio is available on the ArmSoM Sige7 HDMI TX port.
Enable it for HDMI0 port.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
index 6a0fffaa26ee..0ef8ea76b0a8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
@@ -192,6 +192,10 @@ hdmi0_out_con: endpoint {
 	};
 };
 
+&hdmi0_sound {
+	status = "okay";
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
@@ -290,6 +294,10 @@ i2s0_8ch_p0_0: endpoint {
 	};
 };
 
+&i2s5_8ch {
+	status = "okay";
+};
+
 /* phy1 - right ethernet port */
 &pcie2x1l0 {
 	reset-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
-- 
2.43.0


