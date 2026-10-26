Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7E5606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 18:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KY1bPrP7;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dMHGd33l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=; b=KY1bPrP7/V4sxb
	IYrWWPhMUt27bT7dZbU63fOVipk7wlNJpHRbn65gXomvv4sZa/Ee6r4CCbXiQtM9CEEUnYsf39Hu9
	seRWzCnxN/3NMUOeVJisAw7Bfu+TtCKl8lVxQWA7IVo9aMKluvdfViRPsecjL4+j6JIgt/SJcXfSv
	Lzrw6VcSFTJOznTXvYcpn0LYTimq9XmuP3kqYX3sPbRL5hFe5AwJLys6tcJ0X4SCaurIlz7+vuj8y
	I0dpOMZd/5SubArAlT2K/+ksey/EWlVTQslW9/mnOPPPAY0PtncjJRI0luVOibGp1G6CFKscC6oib
	BrM8BakDbBi++UAjHMcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPSK-000000034rK-3DuT;
	Mon, 26 Oct 2026 18:30:00 +0000
Received: from mail-qv1-xf62.google.com ([2607:f8b0:4864:20::f62])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPRv-000000034Xv-3zMu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 18:29:37 +0000
Received: by mail-qv1-xf62.google.com with SMTP id 6a1803df08f44-9178d514951so27549156d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039374; x=1793644174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=zH6Ey1MWf3XQlLb3w10ibCinsktTVJQbRH+r3EyVyR7/O15TqsN1B41iqQanbOcI8I
         4rWi4leem/hKDdgkIi9gsic0q/vBUqVvZ2yZlVJ0QjFlseJ/EA32XC5AteAjKXE52z7Q
         1h1hWMRW0Yqrkuq3flt5ekOI5mS/3498WsjJSOtPXBWFQIKWb/tpvnnD27STn1bSreAl
         U14RaYdY7AUTkCA6euHE7zHgNJ1SFQq8QPgzIRzzw77VJ3yx2R0Z66P4NrRO5Ud+pE/N
         s5lnuqeNwA7TNpiVYD+TFtK9EVdkc5XZL1rgU1fHnVK5LDlZM9P4N452f7ec+3pY6h2I
         evcw==
X-Forwarded-Encrypted: i=1; AKwUvByqaG/HQ1ZdLjJsvtm55Bjy/tZ1ViJ1VDBiA43rbX7gmPaN3J5CMB7K263MVuzeN5ezRoQO7c9v8e0v2K3SSHF/@lists.infradead.org
X-Gm-Message-State: AFq9FYLBYmE4GFP6NpJiDgpFUNlMynvR2Qb5eFcNZa4y5WXtQCykDdmE
	AeQ9w02cj9/iwYYREu+tF1ObysHjrl+lxdcvhUybf/Xc0Qz7PORRkfmfUWwvymRD5+P0PnAF062
	5lfURQQLvxKHQILDRXih5bUzE1Zmd9ohHln6GyeBGGU3KjYDlN4x/szZ7Bss7kULipKDIEQjA5N
	126gtcgM1XhVpE0qKbrZjA2PRoh2VuW9xp0rcPcWtdhyvQaeIun22NTV8GE1pFPUiZUYHCkfGjQ
	9Ifkv7U1rk5Qw++zpIVJfaEOGQHI9ZKSHciiA==
X-Gm-Gg: AYBFou20N2AlQKA+3KAS3G9L6DUSum6C2s2aMfvQdkqQIrS/x/2oY739XzCA8n/sLfm
	9wi2gFyE5DuS8QoEA8kT0OLG/5jBb2+nvGsyonUhKJzUjTziql46qJvdmAgJXTG8vc3AG8wEsQ7
	hc2WnG8H15bN9WMFUcV2JKndZLfzdvANI5UnOzKMwvsb2fqUcEN6EkDZgM5aMDzvDAvN59MjbiL
	pkQwD+LOqYxphcUyVcdTZbwR9W/Z5r21cET72UUIOF415KgnjVzMAYIOJDvU8AGv7pCcshy1aoE
	wet9JRZxLDqR1OFj+XnbdZd9EK6Sn7ghnG5+msV42ZqRcgYEAYBqfmN1pyq//Ntvbj3LvcRQxyE
	PJ2EPBISH0YuuqoDsL+TkgO1vMRhDpqSv9q8zlW1TacqjZkz/W8LQvmcVZt9prS8kWh8LUerjhG
	o1YH3i84uOYjqHdmbwyJ73J4BgnE1v0SMupoI0tOtUEaA=
X-Received: by 2002:a05:6214:5006:b0:917:aa89:4168 with SMTP id 6a1803df08f44-91c48e5ace9mr139791666d6.40.1793039374340;
        Mon, 26 Oct 2026 11:29:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91c47ccfb67sm801686d6.57.2026.10.26.11.29.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so15640373eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039372; x=1793644172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=dMHGd33liVqrSzmqTfPeO1+8lro3qCRDmSureGjMbEyFuguUJFey4yyAP+Dv8akfHc
         wVFfRVHM0dyYRAZ5BgOJat8E4fmh6NuRlAovA+6Ll0GTu8HgCrHVKZpJHLvWW1KQDr8k
         U2mn0yAq7h4C12rxIO+hZoBMeupSt3Bwh5qHg=
X-Forwarded-Encrypted: i=1; AKwUvBwcAlKDUR49jgS3ocTeE6zRWVc2tMiXWjoNUZyEDdbZsq7ArmWzWsrdxT4wiK18UBIHKWg/OaFs1YbBvI/PY0dx@lists.infradead.org
X-Received: by 2002:a05:693c:68db:b0:369:f7d2:d7a0 with SMTP id 5a478bee46e88-369f7d2edf6mr7300559eec.25.1793039371727;
        Mon, 26 Oct 2026 11:29:31 -0700 (PDT)
X-Received: by 2002:a05:693c:68db:b0:369:f7d2:d7a0 with SMTP id 5a478bee46e88-369f7d2edf6mr7300511eec.25.1793039370933;
        Mon, 26 Oct 2026 11:29:30 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:30 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v2 4/6] ARM: dts: broadcom: Add the NSP SATA IDM registers
Date: Mon, 26 Oct 2026 11:28:54 -0700
Message-ID: <20261026182856.3168686-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
References: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_112936_052524_C02155E6 
X-CRM114-Status: GOOD (  12.89  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The NSP SATA description omits the IDM block at 0x1811e000, leaving the
interface clock and core reset dependent on firmware initialization.

Supply the IDM as the third controller register region so ahci_brcm can
perform the downstream clock/reset sequence. Extend the AXI bus range to
cover the complete IDM aperture.

Fixes: 8dbcad020f2e ("ARM: dts: nsp: Add sata device tree entry")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
index 6a4482c93167..9dbcd810e27b 100644
--- a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
@@ -168,7 +168,7 @@ periph_clk: periph_clk {
 
 	axi: axi@18000000 {
 		compatible = "simple-bus";
-		ranges = <0x00000000 0x18000000 0x0011c40c>;
+		ranges = <0x00000000 0x18000000 0x0011f000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
@@ -538,8 +538,9 @@ sata_phy1: sata-phy@1 {
 
 		sata: sata@41000 {
 			compatible = "brcm,bcm-nsp-ahci";
-			reg-names = "ahci", "top-ctrl";
-			reg = <0x41000 0x1000>, <0x40020 0x1c>;
+			reg-names = "ahci", "top-ctrl", "idm";
+			reg = <0x41000 0x1000>, <0x40020 0x1c>,
+			      <0x11e000 0x1000>;
 			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.53.0


