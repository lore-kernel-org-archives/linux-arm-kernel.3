Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A74CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 16:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=paRKTns1WT8quydNofkJCuHKZQbF54gWy9Rd/nrzvfk=; b=YNWC0PT3oZ2HKu1qp/E8SfJDpF
	4GZxF/kUyOKHK6UQtoQyxR9J/44EfhXhYq6Fe7f1osGhuveQVwvfOF7eXHiICnSUiNIm4vUfnG+Xj
	jDffB+f2LW31ydJuwzA1Q8GHh8lgZwpGM++41NFN05RwLPtNHHGAWoDq20xmIREyoXy/izWWmQX2Q
	tx6ekL4+tvuBeTQdhH9MumaN01r+/gDrWWuYxqzmwmxH3n8dCdfKkD36mRgcqP5gLuU1IVAhQE/5m
	3nSpiQQdEcJsRQVxAFVSGASjVXqLem7GMT7Dy4LqeztoLCJUGQCosKq7HQbfI+ZtUC2mltgk7k7sg
	cK26jlAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBFb3-00000000A8d-2DvB;
	Tue, 21 Oct 2025 16:52:29 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBFb1-00000000A8H-1OGu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 16:52:28 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-373a56498b9so787211fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 09:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761065545; x=1761670345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=paRKTns1WT8quydNofkJCuHKZQbF54gWy9Rd/nrzvfk=;
        b=QprKlK1Rq/6QsXgZlcrzTw3h8UH7gswjPZ3wD1z1yBITGC0OyHysZluIPRUKI9UTsh
         s1ThJP3e3SgPnNmfaSgM0KtM6UujA3gaD9RGtVOOpTus9EvgunDrA7tBLMMdKO47j87K
         eFUuH1wnYFgycUvpH9MsB/OlBhJY/16OH9OCSEfSXp9W5bUxlnGMd05m3BUpeVu8ubVB
         O6EpBnniCd//xKsOhU+CE5gli6UZn4lDTZfpkDJRgt/cLH260m6kN65/NliortzZ7lEM
         JcmpxOlJZBUV/BrqimeqK+xHwtQoaiNp6P6qAhWLTQO4v3mtx531OVdGgEB3Lw0N9Iar
         57Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761065545; x=1761670345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=paRKTns1WT8quydNofkJCuHKZQbF54gWy9Rd/nrzvfk=;
        b=wl6jKh4RMhSkTtwLGHl2WePuL1HxASvNRnjQNxAYznc0LcE5RCG0Wl9eqqJGFewu6z
         YXtrOw8Fa0WedeRBzaqTHHmdg489y6EM4QIC/uRp4XMJ/ht6gR1Eour77UfBRe7SIRJ3
         eyvyIkVLIIr1wWdKRdhtGIXbqnZHdemrHj83WB0PhjBjgHFspacdu4moX5jmGZS8jAsf
         iH90xV4YlTEfdKYkgEY2MNDKmQBgrevJQG8efBPNt4OZqepcxvnli+dvdFV5i9dy1EPy
         Lf9f0FFCb2IuMIPCmQu59p7Vvtb5P4S/r2BtflTrwMgNoBD8yTaC0ZaE9JGvgqd+0tZW
         6Yzw==
X-Forwarded-Encrypted: i=1; AJvYcCV5YyaJSJ7s1pHaFQnvGTcRmWrBb+Qk9akWRyJxu87fvQtItgUn1hKlaxNsMlfq8Cb6b/Tuf+YhGrV+Lf6reUPQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4MBjTpoaZO5EeOEfKgAparr9ZDXhq/hJy5SSgQyrsM7YqQ7jj
	kO/3foJsQGqD7RzuDhHOXnmBsE0kTbbZpMRHyOn5Mn8dCRt03+x1UeP51+Xb5JbOhcw=
X-Gm-Gg: ASbGncuxlVwyqczyqzBs6PLYkWY37r8NzhFO6cc1xGT9Kog46arwMzK5d/TqwoRI5ME
	gpNSWszrMu00KzaFFOnGDgtWHQT2xXrTb1vpCKHDwCYnHmGCLJ3oydyPsgctrtHj+MF6x0LZbGI
	rfJRZ0n99rIVG/gvGX4TTl+yiaFuHHYUj7B8IkGVgd+cPiHXYqKiFc6A5wfkg82RRX9hxzvbIhM
	4z36yRAlkX4af/8f0LZziSkxBEqfCT8AWIH4RoDtIUe6eaQyu0NGizqP/jy60CAvU04n4Y1kAL5
	Ac3ZD/4dBC8VCcA/T0p7r05pIP6DrV1qtQCSQrzOLIcIJKcYWR0dGDaifXrI11Rl8ToMA1JWNvT
	3PCt63yWXF4dRDHIUSQ9kgHR7D2OiMaUJgEBfBYyq0prkqaLYr6Q1lPfqHr7r2hZjvvPyfDk/Ib
	grsgaV7eWdDWJSAjEawQ==
X-Google-Smtp-Source: AGHT+IGjAkRj9soa7GWukQ8Cihq7HSi/Un2xv4fuxCxdBhttxHc7UDbrzdxzRB84sxHyktFpcpbArg==
X-Received: by 2002:a05:651c:25d3:10b0:377:991f:c1bc with SMTP id 38308e7fff4ca-378bb007751mr918501fa.5.1761065544634;
        Tue, 21 Oct 2025 09:52:24 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a9506367sm30738001fa.34.2025.10.21.09.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 09:52:24 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: Add new sensor unit types
Date: Tue, 21 Oct 2025 19:52:11 +0300
Message-ID: <20251021165212.749372-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_095227_410128_06431ED8 
X-CRM114-Status: GOOD (  12.01  )
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

Add support for two new sensor unit types introduced in Arm SCMI
- STATE_BINARY (0x5E): Binary state (1: enabled/on, 0: disabled/off)
- BYTES_SEC (0x5F): Bytes per second

These unit types are used for sensors that report binary state information
and data transfer rate measurements respectively.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
Hello,

This patch adds definitions for two new sensor unit types that were
introduced in the Arm System Control and Management Interface (SCMI)
Specification version 4.0:

STATE_BINARY (0x5E) - Used for sensors that represent binary states
where:
1 indicates enabled/on state
0 indicates disabled/off state

BYTES_SEC (0x5F) - Used for sensors that measure data transfer rates
in bytes per second

These additions ensure compatibility with SCMIv4.0 and allow proper
handling of binary state sensors and bandwidth measurement sensors
in the Linux SCMI driver.

The patch follows the existing pattern for sensor unit type definitions
and maintains backward compatibility with previous SCMI versions.

Thank you for your consideration.

Best regards,
Artem Shimko

 include/linux/scmi_protocol.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index aafaac1496b0..629acb7831eb 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -488,6 +488,8 @@ enum scmi_sensor_class {
 	CUBIC_METERS_SEC = 0x5B,
 	MM_MERCURY = 0x5C,
 	RADIANS_SEC_SQUARED = 0x5D,
+	STATE_BINARY = 0x5E,
+	BYTES_SEC = 0x5F,
 	OEM_UNIT = 0xFF
 };
 
-- 
2.43.0


