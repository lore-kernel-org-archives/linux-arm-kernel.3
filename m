Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B30FB5EAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1C8bQzpx/uEkLcacI23jZqCv23os2UdSq0AA05SZO0k=; b=iTqTeTZjQwNPYjuyCsRxCgrwgc
	OIvmiiekm8Ap0Bj+n0Gm15V85Gad/AUiW7c7wtR5Wq7PkANVjt0rnXYcUw0QCaTtlf2MpdS6kuY8j
	L+rTYkNWv59gNnTrOeRlaPJxIEHzGgVOQg/52CePt4AbBjAkevRXAXS2sB7VxkcTrokbmXUcla885
	VH3Ee881MBd2GkhE+Ds0WBcruwA8jfkcWHt7sgI8C/6Ws0yVUQWB+K/aGC/DyXrPtyvWc8Y1ZygFF
	Ex7NcOBii1P9IQ1Xkdz/2eUj3qLgncHH/d1CXhrno4Gvag+0dJHgYEFm1Tz4tp50a42lwC03PQGeI
	wJjaDueg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VbO-00000006dkF-1qbL;
	Tue, 17 Mar 2026 14:40:58 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VbL-00000006di8-49KE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:40:57 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso49434305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758454; x=1774363254; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1C8bQzpx/uEkLcacI23jZqCv23os2UdSq0AA05SZO0k=;
        b=wsS1Pjn3XdSkxZhNwf3gzQ9SM9yu9o4riAgCfkJPwTM5zqSAT8g9AZm67h6PgZUonc
         EVE8nFm3TScNG18JHzON7nLbjyxEy3ZEM82e7EpzwP3OTXnd6o59DbK0rsyYJZ+l5BdG
         56yvd7eoZiEFU+qglHqEKEvRy33Dj8pOHyP/TCu0BVRuetpdSY2yRgQPUP08zPyElHnO
         treJuWY9fD4OVW1S2DnX54x4CxkISx2DpstHp9uoYiQUG+aV5ODORi8M59akIYWmXZ4T
         2A/CkJGfm25bOU824dgy9hh3pS8ylUCqWEiKF2bXkUZ4yBqgyl5TfzB0a1GcaG67de+p
         Reyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758454; x=1774363254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1C8bQzpx/uEkLcacI23jZqCv23os2UdSq0AA05SZO0k=;
        b=FbkewFa1p2asaUdrlGboz8GuQ/fHH4eNce3FYf19AMwZIqvHhmIruVye8JN3IXToN0
         7pdc8cYATd6f3EJ4CuxHYIrva+8a66pAk1hg7r3OkriyIlZDbRx5YykbyjpM92985Gkw
         2oj78oNCXag/wd1mi29dAV1zvwdvQZIA50qyIkH7erWAiBm+nbuNBelk+BDLO5b9GTS9
         Jyn7pVOvEw+Z8ygSDWwJVJ6DFv+9fPkOgEuwTe1AYqmKJU+XgNCVWSUOqLDuPelBL9Xs
         7bKOFI/76w5koIGquTJXfu5nXGlzjVgGBmUvmqaj5AEgaOXRDn8VTSf/zjUFRr45qNv9
         kxgw==
X-Forwarded-Encrypted: i=1; AJvYcCXYmUnMOTHrouGlbS7ZdwhQ8zpr6k1rZcB6KbBj84DRF+vr+niDPWT1IXMAZmehWVpsj9+sMVNpEu04tlLUGZ7/@lists.infradead.org
X-Gm-Message-State: AOJu0YyuJKPWB9PtLOdS9fUT9x3MgLNd5FYhy3lcQpbZnebcSSePNejA
	zkDnfqmxECN5m9Xyg1fkjnx75xd5q/7HYU8imXAVC9+HC+pAflxVhFcX/50ppTtWGyk=
X-Gm-Gg: ATEYQzyz+Z/89BPbfi/TBbfbMIw1HFyXtUyyZo38pLR7Eg8m5Fihvw2K1U1TCGDHjwD
	zzVYEPD4GwgG3uPCWkF+yoQPCp/LizNY6oWkPGiggOMyHdoBs3q9N4G/brn2eyTyfp2VQNeO1Hq
	rGTMGxEXsgvU9+HmAPkQLoeHvfZdpaJSQRNsfYIXHZpIHeq6SvHg8jVS5/ADArwTSdUn95IqQST
	+829vCCGsHfcylr2BoS+iKH2fqlGGVyvU/aHTD05sC8V+vCkWv9QWuW5i31r7NybJyHftHk5SAR
	5HSnb/ICNsCR3j5wn1VcLKIdrAh+P5EyM0AaMiM8+6/PMW44a8Kz0/QCa6EA8GJ4Y9IgaQVoFjH
	WnrC3+EAei6r9QlpdUo1MTM2wTIg45N/pwWSc+3ZDGg6XcOVUx+/LWlb6c2ExWHjVLn7eab/20x
	Y04jbZ5d202qdNKsnmhS2S3d4hfEZg
X-Received: by 2002:a05:600c:3b90:b0:485:345b:ccb1 with SMTP id 5b1f17b1804b1-48556720f86mr269439545e9.27.1773758453766;
        Tue, 17 Mar 2026 07:40:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855640d915sm118222495e9.4.2026.03.17.07.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:40:53 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:40:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v4 5/7] arm_scmi: pinctrl: allow PINCTRL_REQUEST to return
 EOPNOTSUPP
Message-ID: <aee820fd35412fc8679558e7df4a912f1fe27f5f.1773757772.git.dan.carpenter@linaro.org>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773757772.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_074056_033834_CF87A325 
X-CRM114-Status: GOOD (  10.60  )
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

The SCMI protocol specification says that the PINCTRL_REQUEST and
PINCTRL_RELEASE commands are optional.  So if the SCMI server returns
-EOPNOTSUPP, then treat that as success and continue.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/pinctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index a020e23d7c49..42cb1aef1fe1 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -578,6 +578,8 @@ static int scmi_pinctrl_request_free(const struct scmi_protocol_handle *ph,
 	tx->flags = cpu_to_le32(type);
 
 	ret = ph->xops->do_xfer(ph, t);
+	if (ret == -EOPNOTSUPP)
+		ret = 0;
 	ph->xops->xfer_put(ph, t);
 
 	return ret;
-- 
2.51.0


