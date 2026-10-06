Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1481BCA6001
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zNl6UGGxbhfecF/18HhuaAiuKj/2y2M+Jhf4QeVujQ=; b=hkEZUfMrKXM3852rZAbTO3WzN6
	jPhim9uE5WjDC3nJyvxcUw0ODbiuArs4VBQvrTS1v5eakGSLgdGiiTnYSTSLZ839kJPU1Qu6JLKsW
	Z25yVx9JDGncijIyCsLw0lJ9XDSJvlGV6ZeefCjB0hkbEodKBqes9KzGQWI/gyadw215kr+yM5u7N
	a0c2B7CE6V6GaN74C3zAMxCizY9IxUY236bBZVPDng9mbXutGDXp8nHcvLytoJ6Sd0kzR/CGh9la+
	4CrcGNPK++SYAiuUk0rzRGETcpV2Cgpanii1nTlZP7tZazl8vnFw/IXP0xqWhqZ5/b8tId9vM8FaN
	WO57RR9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7de-000000016KV-00RV;
	Tue, 06 Oct 2026 16:03:34 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7dB-0000000166X-0JoP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 16:03:06 +0000
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48870973bddso584486f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1791302583; x=1791907383; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zNl6UGGxbhfecF/18HhuaAiuKj/2y2M+Jhf4QeVujQ=;
        b=yuAfALhg+amDVcLAe3mizYgfq2HMtWUJqpbyJKcWg3KHpoC9IfZPLCIlm2UhmWElYI
         P3zHo1fiIE299wAIxsXyAjzCZ2l/B02BIFYU4bBtpOn7Jpr15Z/wXIxqQdv6Q+CCnM+Y
         2ePa/PCvp+YdlJx5yCJ41g0X37ZxRnVz0Cy0m+rF2tjsFcek9oZ2GrnxOlLdb+x2cvvz
         Ord4lXgc8BKCFYixZ8RmV0hJziX73Kk8qjhqrmSxYzLYJbnZWytxRQ5lJ0gt8/gRQ5o3
         fLFTn2QhESky9r7C2J2ChTCejc8X3J4oOhX5+be8DZQWH0BpEXEXzmhSVbRIik9oSLYy
         MSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302583; x=1791907383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zNl6UGGxbhfecF/18HhuaAiuKj/2y2M+Jhf4QeVujQ=;
        b=S56lz3Ad76pyfFVCYS/rtyW3sE0pHjdH7HubLDZLebXCDuPBXf9h+pgB2vMFqC/MEj
         JxUTWmvQj+epVOWdo/YhMGbEShokWyW8ORw8y0fqVJ73V5p3KM1i9+p8jgA5QMBZB6bn
         /GR3PqZwYwci0nrugtf539bQGFTiJPJatJou01ncRb9zK5AzEIUVjGvrKo4uPfFi9m6a
         VhUbufLG5cVlbn3/b/w9qMvcmGckhWfAzYF6uawmgNTZzSLw3LB3fSg/mC1064C+2GLc
         6R8IPx0GRl2qB+6Rl/szpVd6mYPHmgsbG09hY/80mIuNsXL52KkeyZbN3u3MpYvq0WI2
         6tJw==
X-Forwarded-Encrypted: i=1; AKwUvByihn9VifF6w6CqqBnk1zUFVJNroc7BXXmmptrprYx6cCO3H5xVyOxllvZT6gmYj7As0wG2cSOEnnX4HNUorq1Y@lists.infradead.org
X-Gm-Message-State: AFq9FYIIiOeTmScYjHCQV85OukjJqPvFxh+Qg2Bnw6UwuMWtDni8WWIx
	aqjON72llxYJkjT/nsW3DzGXDjl46xICUwBOMXyELfkffgxi9GcVrnGgdMxRqnEF/jY=
X-Gm-Gg: AYBFou1rY6+1mU7lyxDtYJXf4N+KFGKeU7bR1yjLoBQHK4rfh0ZCrUT5Uq6K7gX+9F/
	eA/44VzK/n9eBm9QIdz14yM7q5LiS8tkBnK48zrk6YMDNnxvM/OnPNQATHXh6dPpcxeQwtHX4WV
	2Nh1Od8BBVYGAB6C8j+y+jtxSghXg/uGQLnqnUGllMY+gOv88PEcNoSMObJBMUAakNBRRmrmtC7
	OHcqnc6aUaK8PXVBwfEPQBUMpqPB7dx/xlucjbZo7dyp0gAOTAqIentsZ1TsXu1fUxjPG9llK3K
	yuhc81CWOZK6to8etYZmuHsCBHblwYpG/ev4WiehmMAMtch4YQ8Bacqcob3Yjymy5IFeBtR2EjY
	PFHpCHbkTtc42bnbF062OpsT7/dvabcgFoC4uhsaT7qPRhgcPnI3B+EDLMh9/pTwDbR6Erzy0m2
	zVfoHQ/iDqOasmVFwNGbmH3AowQ9KCu/+R9eDBVgUcp98rui/I2mhF1AeOHk3IkvWmqh8ntEePp
	B2XkbuUCOm+2OKDKA==
X-Received: by 2002:a5d:5f88:0:b0:48c:4a62:9b31 with SMTP id ffacd0b85a97d-48c6d164fa6mr4430220f8f.5.1791302582565;
        Tue, 06 Oct 2026 09:03:02 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.85.242.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2014asm369641f8f.38.2026.10.06.09.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:03:02 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 06 Oct 2026 20:02:43 +0400
Subject: [PATCH v3 5/5] arm64: dts: rockchip: name the reboot mode supplies
 on RK3576 EVB1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-rk3576-reboot-mode-v3-5-6edba064693b@flipper.net>
References: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
In-Reply-To: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, 
 Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1763; i=alchark@flipper.net;
 h=from:subject:message-id; bh=DtVVqhzPhKpRS7Y/KUFbFu029wxRWP23ekIgrNJm73c=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQdlV5zMMsjyuKV/rLErP3XNq7l+/lozp9X/l5VzY/9X
 wZNmL5PqGMiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICp/nya4a/sRJNX3Bof5p+oOy9yeUfrnttnuN0V1R3vZ+1LO6Wg88KdkaFdSUL
 OXnvJHnWLuJyWIqa1T0p6FDJPTRBaLpeRIPWihR8A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_090305_194087_3F51CA56 
X-CRM114-Status: GOOD (  13.63  )
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

A reset that carries a boot mode request has to leave the mode register
intact, so it also leaves the regulators as the running system left
them. The DDR firmware that runs next configures bus QoS in the
interconnect, in CCI_GRF, DDR_GRF and NPU_GRF, and faults if a supply
behind any of those is down. The NPU rail is the one most easily left
unpowered, as nothing else on the board needs it.

Name every supply those blocks sit behind, so that requesting a boot
mode powers them regardless of what the running system happened to keep
enabled.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index f83d129f96f1..d8191ce8bd42 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -957,6 +957,22 @@ wifi_wake_host: wifi-wake-host {
 	};
 };
 
+&reboot_mode {
+	/*
+	 * A reset that carries a boot mode request leaves the regulators as
+	 * the running system left them, while the DDR firmware that runs next
+	 * configures bus QoS in the interconnect, CCI_GRF, DDR_GRF and
+	 * NPU_GRF, and it runs into a synchronous abort if any of the blocks
+	 * is unpowered when it accesses them.
+	 */
+	ddr-supply = <&vdd_ddr_s0>;
+	ddr2-supply = <&vdd2_ddr_s3>;
+	ddr-pll-supply = <&vdda_ddr_pll_s0>;
+	ddrq-supply = <&vddq_ddr_s0>;
+	logic-supply = <&vdd_logic_s0>;
+	npu-supply = <&vdd_npu_s0>;
+};
+
 &sai1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sai1m0_lrck

-- 
2.55.0


