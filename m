Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1063EC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 19:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SDDgjq+FLrfVveApew+3CiL9S8tkEEemKYxqci8Nfsc=; b=IJMuQnkwRyet1Lro2k0K998Kdj
	7yCwLNhlVnbSSPlQQuDqkYg3A+3CBs9dzC/Heiuq11xwSXT0qk7WO7hLljaJnx80blGJrzRBme4HK
	R/R7aS9yoGr+j7gq9c45dwZUi/V70Y84BtL0cepmC4SlPmcuhqm17uum126uV+xF8GnMouC2wF+Mr
	exY5xgXmyVVelTzsPrynYZKcZMxzS7slwMvs745wufuF8GpPxs61ZLO8KQCA6qq37CCWDIxYYRQ+q
	NK6MOzOEuqnNZe1iXB1f6Vzoe8+e/jgcHcika4N7/TqJom3F7i7AeyR5SsxPAYQszm0sYn5gOcqu0
	evCIBNfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAuEN-0000000Gk6P-48r8;
	Sun, 27 Sep 2026 19:08:12 +0000
Received: from mail-dy2-x0d.google.com ([2607:f8b0:4864:36::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAuEL-0000000Gk60-19cj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 19:08:10 +0000
Received: by mail-dy2-x0d.google.com with SMTP id 5a478bee46e88-347327e3aeaso318756eec.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 12:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790536088; x=1791140888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SDDgjq+FLrfVveApew+3CiL9S8tkEEemKYxqci8Nfsc=;
        b=SNLQYKKLDHWpokpaOfyGVcOK28Z9ZHcq0lW1/we98JVGrCJtRYRdhvKyOROQB5l3N6
         DQTwhsRq9MSqrziPTuw0gIrPbzVCxuOGv93CqdyQUAWqQUVpFtK/PTUwEoXnclxzWlYI
         yZInu2KF9S7nFc52pplMQM3sHEfEqdboIvGW6pL3qRHoQlVOUavnXBCz1F3pg1Jr1iAK
         ViBpydMD9WLVvdsU2cTVEDWIzHnkaEnEA56sivZ315BB9OtnxNe3XDeNCETrWLZs06cA
         l6gcg6vSccqeujpKryWX3He6G5Rr8SAcQsgLZSVpTT0kzvRICJb/O49YvyLY0AiaSK1q
         SX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790536088; x=1791140888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDDgjq+FLrfVveApew+3CiL9S8tkEEemKYxqci8Nfsc=;
        b=PqZUYu+R/GvW1IreGt1+EhXeFJRXuFOjzNc3rgvKmyM32ZUB0a3KrSwUeqLs69cjlp
         jWDwLiGnWTnZ5lHWmiqjr34dYcgQFtFNJahYNq/7rTwMUZBBgaN3ky6zd55QC/ukheJ5
         I/BANitVRp/Jm6LK0+B4G71F2nfEp3dOK1coViufzeQs/OIibiTM8MWvfNEvCjIbsrfd
         4Q8kqyAUEdwQqK0xufIDPN50GkubN43HMlcxs6l0lbBvF/TyVt4KwwTN/s6iTef7gSt4
         QlT2hzfAdj99lMvrIKjWtgowC2eTtl2DsFCW32ghZzs4E+iXgmRpK0F/k9suT67kJ8uc
         XbZw==
X-Forwarded-Encrypted: i=1; AKwUvByegIYVvuc7VxfMln9YAnISP32Ye4SkIxMdoPYB6kzI+KqhYN14tB8E7jx9mZV4Lp279pGJBBljx8NAZoxAUiIb@lists.infradead.org
X-Gm-Message-State: AFq9FYKVy6FHjy2Rl2K0hNcIULzTSJysWMEAXd9jEyzxeARFjIoy0MJk
	c1e7GfbcMkCM07lWriIJGBVWnKjOgUzN2NdCZp90xdmyfwrgzCcYCnxU
X-Gm-Gg: AYBFou3gX3xp041dqv22tIWwZU0a6CMV9P/PCim+Rgr4oWv3eZoQ+26LMXbzYq1UPcY
	NPUfciqo0cj2hKbSUa1SRT8ApCWvjIDgrimI6XGI5ohQgva2XubBYI5Am9mDTN6ULd6rv2MckqK
	3UNdVktMn+1rnRt/wnlEytrwHLQrtbXforukF3YXzpt1XCxFdmoEfk2gpHhqD+3QTtisHzjN84G
	a5oAmd1j/xxNR8r6kWSTY0jXhkn+Zy498SXSA5PvgJQQHxf6RP0RlrRWW7vMTT0t+7UN9UAMZ6C
	zIPksvjPQs9svxbb0gD/oGyq6Us/37JiVZfV67A9GJSEWL5X1uiMGfd9w0Bkv+Pt8k5ZHGQuCJo
	sRuUy8chTC/rz1S5qTk4xgMdcWvpHoVac3yI9DyWq7RmMXSEQLkx7jrB5whB9hO2dQUWskwFBBY
	oF4PeTZzzI9V5Mtj/5xChwYe4DpdKgwT9jWadxJ01L8u8mlUSsJSXR0GAnYaavjZfL3AHUiQ2vH
	kMmuQvTc1FCH+42dEIphGERg9nj
X-Received: by 2002:a05:7300:4f1c:b0:342:19b0:1c92 with SMTP id 5a478bee46e88-34273549d27mr7996388eec.35.1790536087021;
        Sun, 27 Sep 2026 12:08:07 -0700 (PDT)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:5bb1:340f:98dd:fd61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343580930e2sm13639702eec.16.2026.09.27.12.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 12:08:03 -0700 (PDT)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: krzk@kernel.org,
	s.nawrocki@samsung.com,
	peter.griffin@linaro.org,
	linusw@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	morbo@google.com,
	kees@kernel.org,
	justinstitt@google.com,
	aleksandr.loktionov@intel.com,
	codemender-patching+linux@google.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH] pinctrl: samsung: Use snprintf() to construct pin bank names
Date: Sun, 27 Sep 2026 12:07:58 -0700
Message-ID: <20260927190758.609156-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_120809_320925_894825C4 
X-CRM114-Status: GOOD (  11.62  )
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

From: Bill Wendling <morbo@google.com>

samsung_banks_node_get() constructs each pin bank node name by copying
bank->name with strscpy() and appending the suffix with strlcat().

In preparation for removing the deprecated strlcat() API[1], format the
node name in a single snprintf() call, which preserves the existing
truncation check against sizeof(node_name).

Link: https://github.com/KSPP/linux/issues/370 [1]
Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 5ecc9ed4c44d..0d639eec689c 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1155,8 +1155,7 @@ static void samsung_banks_node_get(struct device *dev, struct samsung_pinctrl_dr
 
 	bank = d->pin_banks;
 	for (i = 0; i < d->nr_banks; ++i, ++bank) {
-		strscpy(node_name, bank->name, sizeof(node_name));
-		len = strlcat(node_name, suffix, sizeof(node_name));
+		len = snprintf(node_name, sizeof(node_name), "%s%s", bank->name, suffix);
 		if (len >= sizeof(node_name)) {
 			dev_err(dev, "Too long pin bank name '%s', ignoring\n",
 				bank->name);
-- 
2.43.0


