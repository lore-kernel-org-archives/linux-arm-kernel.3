Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCAFCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 19:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XMjqWfHnxx+2cq14q67XEqDooplTsFFIcuwaJm5RkY=; b=kqlyIlF3VxzAUhAlFh2sKWdncX
	EZWgDecVqjbHEji0NrMU7a5LDPgAgYKVVoZ0KZgJcXE5XNlB+koNPRIAvMv3HQ9g0IodRSsEmKjWG
	4G59B9cPXvMgNygypFW1C9RfR55IlyV5mHGeBP4fhqrNfkn9Pqq7GPeFzxMpXHQdgLm9o1boL16g8
	Dp+W7Ve0AabuYrw82u3x9/cA88C2+kJIlrow/MtxcCLaS0fat+26VvsoC3I6t02ucPIvzWUH4e6Po
	IZbGiWJ+pgt/uNKaWZOFACSc1FS7YOzwyX9sxL5aJ7ZA5QW1qkkrlJNiyZzLCmC8qouC0Gt69nsY0
	Kq+5uX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAfM-0000000DjLG-36MB;
	Mon, 01 Sep 2025 19:58:12 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7Su-0000000DGRz-28TT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 16:33:09 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55f6b0049fbso3396028e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756744387; x=1757349187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XMjqWfHnxx+2cq14q67XEqDooplTsFFIcuwaJm5RkY=;
        b=hIvZ6FnNyZTxXhZgaEeYSv/m+lIDxbft6WLY07iXJC/UU5oZpHWZyHb8sdCuBYghoW
         wdHu2b0j83d62d8Je5nXKTQlAunnNwDDRNz7wLT+MPSGUUEpAypHl5EO5cx6lL1FmaKQ
         MjEpqMRzN/mbH8uuPkistE8QDk/icFljVuumKGQ/gxYBjhEvyX7L4LP5FDsHgjgLzLrO
         xM5iWoGWPOf4AudQjBBCFw0QCQ1+MR3yeImk7w5Vq40JxEGQ79IBk7vVlPMT7Dp4kJPD
         qlxW2DOZR25ECIEKQTYSXjWV6gQAKUuWQ16er6aDZrkxYdkfmwuPUIX62ZSSxNH3JESe
         vHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756744387; x=1757349187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XMjqWfHnxx+2cq14q67XEqDooplTsFFIcuwaJm5RkY=;
        b=n7kyGM8w/4uAE9GWWT1aMZAwest606ar1aiRfYnPosc7NqbvPAbH3iTBCuGbFQ68ob
         BzLreNtfXZCFYDWsH4vjNK5G4C1BMTyvO+93xkITZ0NGGMsvmBekDm8hxREfX8ndAQUd
         hK5igfFufVJf6+iG3jdmJiivTa3P7KgFGJPLBE1dVibTIjG0JYdDkIapc+FY+b94G7sV
         ap9oUo29oEPxwtvcB3/r1+Ss1dzDXvb13cyiNw+l32OtM+iejwgnsfvgRLJGuVNHe2us
         Grbbw8DMcV8xC6LemngJcFZMo9IgnERfK+1wjGM3UbTOtAEUEBaVjay9/uDzuuGb2Ruk
         5JPw==
X-Forwarded-Encrypted: i=1; AJvYcCXnEwmkA6Dka/5n7upWq28+CKPPtYp8u51Rm3p9FsFdDrunWOtksT8o7C73djzbfHhXWUjDOWtgPB/sJT3Eqp3L@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj/WbeRayinaHl0U09h5VuNE7U9HM5HtqdoZWZR0yr6+/FyNJI
	bDHDBopbgMZIcPiJ9rIF/cB3HzYkIrdLUz+KjOe6k9y8A15owZ/3ds/b
X-Gm-Gg: ASbGnct/MaY5BFYusDZn+pkbS8vFTXdaw1pUrggl3Fh3dwKE5IJZUW0imUfEa563Gnh
	5wgL4aK5vyAvH7ZZDLh+m9FRRqZV6EH4Yv8udODNxNuCgut+coP7iRRxTnaBTTwH2pGwmPbHM5l
	CXt/9VgLczkqa/Dh/FBZ5wYJDMUO6OpNbbktdyyJ1OczbRQR0Xpp/RwzrqjeVbW2Kh2WEFciZrc
	GM0JUYO2H98jqqcpgFAnlPC9wir5f5uVA4cVIWX/tbfrRpjQJdDcykc05p0MviVHCzRaQlGWQ5T
	WGY+K3DXYh9RAmWOykPVunurRQpkv+WBC3c18imlmVmqatV2vW1p8SPuKmyeO9sSmWdq992Q0le
	da8h2cErr/Vi7QQxQbAO0XXNvBxJRJ3Vla42b7kwWeQ==
X-Google-Smtp-Source: AGHT+IEVw8ibn5NsZeWB9fEuXwUWCNSL2Z/Kfo1KnKeiipMhJM1r3ia8OLUYuo+3dtfeyeQofbBxIw==
X-Received: by 2002:a2e:b8ca:0:b0:336:cee0:d477 with SMTP id 38308e7fff4ca-336cee0d925mr23787551fa.27.1756744386636;
        Mon, 01 Sep 2025 09:33:06 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([88.201.206.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336d0e78e82sm15291861fa.53.2025.09.01.09.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 09:33:06 -0700 (PDT)
From: Artem Shimko <artyom.shimko@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Artem Shimko <artyom.shimko@gmail.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] firmware: arm_scmi: fix alignment in protocol_id_show and debugfs calls
Date: Mon,  1 Sep 2025 19:33:00 +0300
Message-ID: <20250901163304.2504493-2-artyom.shimko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901163304.2504493-1-artyom.shimko@gmail.com>
References: <y>
 <20250901163304.2504493-1-artyom.shimko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_093308_546163_1F97E1D6 
X-CRM114-Status: GOOD (  12.91  )
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

This patch fixes minor alignment/indentation issues in the SCMI driver:
Adjusts indentation in protocol_id_show function to maintain consistency
Fixes alignment in debugfs_create_file_aux_num calls in raw_mode.c

Signed-off-by: Artem Shimko <artyom.shimko@gmail.com>
---
 drivers/firmware/arm_scmi/bus.c      | 2 +-
 drivers/firmware/arm_scmi/raw_mode.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 24e59ddf85e7..e1e82139997c 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -298,7 +298,7 @@ static ssize_t modalias_show(struct device *dev,
 static DEVICE_ATTR_RO(modalias);
 
 static ssize_t protocol_id_show(struct device *dev,
-				 struct device_attribute *attr, char *buf)
+				struct device_attribute *attr, char *buf)
 {
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 73db5492ab44..244453d3e7aa 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -1280,12 +1280,12 @@ void *scmi_raw_mode_init(const struct scmi_handle *handle,
 			chd = debugfs_create_dir(cdir, top_chans);
 
 			debugfs_create_file_aux_num("message", 0600, chd,
-					    raw, channels[i],
-					    &scmi_dbg_raw_mode_message_fops);
+						    raw, channels[i],
+						    &scmi_dbg_raw_mode_message_fops);
 
 			debugfs_create_file_aux_num("message_async", 0600, chd,
-					    raw, channels[i],
-					    &scmi_dbg_raw_mode_message_async_fops);
+						    raw, channels[i],
+						    &scmi_dbg_raw_mode_message_async_fops);
 
 			debugfs_create_file_aux_num("message_poll", 0600, chd,
 						    raw, channels[i],
-- 
2.43.0


