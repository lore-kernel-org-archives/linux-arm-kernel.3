Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D1BC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 08:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S2y5oYcaSI4UBJDG+9jJe3TDfvdo62ihfoVlT1vvxHQ=; b=Qi0mAlWRzs7MVzMukbmX0YoBEV
	PupfTWPm9vxG5+0yiPp9xUfkmeSueLNVuRo+hPEXC2/oA1rvDBkenRtRlYllhJqRJv3WXa981/75T
	ZBPg3S5xyOhN9nPhweavL5u2hRDpdjTu/qMaSCOHlNSO2UsIKMR4GMtawM4c5SMV3vaJndjeiUg72
	eZRGigMgJDxUuvynvlV1eFTeBIaH9YuawVYuFf2SngFW6sK4rR2yqLqZxlTwvyzmSEvkr1t8nCMCi
	enG03vM9WLcxt/s459yoYa8kQe/G5/a82JZKGPv73Y4NZ/kiUtrgTRIRIGeQQmS1AmxWbnzdCZKov
	wkHAQbKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tasoh-0000000C163-3E4x;
	Thu, 23 Jan 2025 08:43:59 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tasmI-0000000C0et-2xOv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 08:41:31 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aaeef97ff02so125764566b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 00:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737621689; x=1738226489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S2y5oYcaSI4UBJDG+9jJe3TDfvdo62ihfoVlT1vvxHQ=;
        b=JsKMEhYYqy1T+btwmN6cKvpAH2PWX+VJSZD5nxWGnQV01HyOFOwcqXYJI/l3u+6OS5
         2uMAK4Gzo/YQ2PvysChiaekZpt31iHqjkmNHKSNA53zRFPRTA6xQrWcBp2W4vkcJ6mZh
         Km1Bu1UYRMw9NjKf/3sxJRJ84aDdqbUCo42F463/vp760h39d92o/uP2yqB9Pi+fQg4W
         DPIR8zOVL7CM4oF2uWKRhO57kiNQ8yKaEI1AiuGyrml31kKYHrJIJL5F5ovmf0IHZDVV
         xW2ALmyiEpQ9IiI5wv8bNjIEk+nXxyFDKLK9qIMRvbMgGedCVMvJVEv6PfzaXdMlDFd4
         D0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737621689; x=1738226489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2y5oYcaSI4UBJDG+9jJe3TDfvdo62ihfoVlT1vvxHQ=;
        b=niLfwCPBQLlD5MHg1k4+6qDoyvmNxcuBhT9sVSrTRy8iGUsuW7adSwM7r0EssFWdWm
         V7qn/i5utQxNBqlZ/rfj8X8YYm26jV51pTD9BNUxVfLoSIXsgsy+C7dPuNnsoyE8UNEv
         pFwYt+7V0hpV6wTUHO0XWdjC3PY+n2PMa4/DitT3rggv1ejZmbz2iNZlhvqqsOf9Xn6E
         0al0hi79wOdnhOdOMuitQPqU9uoSKJkVvKfjSgjDh0Ffeht3QZ2+GTN7H9Y9ldLIP/sJ
         27Myyzyti1Sv1fczxAHSlG9YWnxYt40thr1gfrXF8AbnZKhkYfPpP2X1PrRBKFvC3vSA
         BZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyYP/8NlMc3j1o5Qn8NAe4a1FmJFnLsNdhnapKZxLPA6NR2SpXJffXGB9CyqjPdfn8fFheqF4UZy2HKR2xYu4W@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1iUTOydO3NMMYWKfixF1eihFKVQoqXy9G+wGoFpk8wSGXYQBm
	F7CqpFlzBkrmYaHjXf7OlyOgl0j/FtOdpwyOFy5nNd0675BrRDZj
X-Gm-Gg: ASbGncsMASM1ZrJWpqctbcyCKYAdCJFbnhnwVIjntUP/BTbrcgOZMuwmZvKN+e+G7y9
	O0AVJAUdDALTLk3B9A++nt2gYv1pftg8cLaPTEf6In4E+dt9vpOtmdwGBCEo4szMNFOk+9KDxDB
	tYUb80w8cWQIl2cRMXadgmBcDmEOnapXNWA0VP2z4qsglYO1jt4b25baRXXivjxNU5Fq4gdL0Yo
	OrrIzuCme6G8Q0TiEOBhpviBIDZwI0IwnHThdBM+QIYvZ8P905rKAS794luksV31AcmPVIxCJGS
	oIAa
X-Google-Smtp-Source: AGHT+IFkaVPaBMvB5rcbN4hV/EU/dcj7Ws/sBuVzb+rJj8kAP/ApwFVhsti25NHx4pZGYU+LgV4BtQ==
X-Received: by 2002:a17:906:ae86:b0:ab6:32d2:16dc with SMTP id a640c23a62f3a-ab632d21aa0mr1028215166b.11.1737621688285;
        Thu, 23 Jan 2025 00:41:28 -0800 (PST)
Received: from linux.lan ([218.76.62.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f223f3sm1031867766b.116.2025.01.23.00.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 00:41:27 -0800 (PST)
From: jack21 <jackhuang021@gmail.com>
To: sudeep.holla@arm.com,
	cristian.marussi@arm.com
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Huangjie <huangjie1663@phytium.com.cn>
Subject: [PATCH] dirvers: scmi: poll again when transfer reach timeout
Date: Thu, 23 Jan 2025 16:33:24 +0800
Message-Id: <20250123083323.2363749-1-jackhuang021@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_004130_742031_7528F0BC 
X-CRM114-Status: GOOD (  10.66  )
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

From: Huangjie <huangjie1663@phytium.com.cn>

spin_until_cond() not really hold a spin lock, possible timeout may occur
in preemption kernel when preempted after spin_until_cond().

We check status again when reach timeout is reached to prevent incorrect
jugement of timeout.

Signed-off-by: Huangjie <huangjie1663@phytium.com.cn>
---
 drivers/firmware/arm_scmi/driver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1b5fb2c4ce86..10b049fe5fd0 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1246,7 +1246,8 @@ static int scmi_wait_for_reply(struct device *dev, const struct scmi_desc *desc,
 
 			spin_until_cond(scmi_xfer_done_no_timeout(cinfo,
 								  xfer, stop));
-			if (ktime_after(ktime_get(), stop)) {
+			if (ktime_after(ktime_get(), stop) &&
+			    !info->desc->ops->poll_done(cinfo, xfer)) {
 				dev_err(dev,
 					"timed out in resp(caller: %pS) - polling\n",
 					(void *)_RET_IP_);
-- 
2.34.1


