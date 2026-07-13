Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84D6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUX26WpwvVrJFwxAmnUDIQNXofqL2zgl9QzvPbM33SE=; b=hFnmn67TvIGWvN/WwsJR/WVxl3
	rosx/+EpZKaQbDWWZy30vgm8zERoSNh6d6eInqHGAB20wwXVFcckai6QuVQHUcp5FmUVrlg7MB9L3
	Jqk79b7rIethd+leAT5Swzlz1iQJuj6GLR4pqt+ENI90QY+AMpXy1JD+4BdGOVq+QdNjFHTEpF2Lr
	V8R9B6cWVu3K96PmTa89LAugJkCq2OTSfQ4nGf3I1AX0R7a8c8F+VWl4/82wV5V0h5Yx8vZrE4E4g
	QJgwPFJBo7190Gs8tcni4qnlH6NAX3BnbNsG6GsnioeVChmyBKG1dxAAz6WmENuo0/n9nhRodCiAL
	+1x5POXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAy3-00000008NEo-1Lum;
	Mon, 13 Jul 2026 07:20:43 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAxw-00000008NBt-1FjS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:20:38 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-39c62764c7cso31570601fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 00:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783927234; x=1784532034; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUX26WpwvVrJFwxAmnUDIQNXofqL2zgl9QzvPbM33SE=;
        b=qffmsO0KMTurvtbfP4Zi713KidpYYlfpYONKuWvpDHTqf7pKZ8RM05sVbPChA45Yxq
         wkVqKPC9NBbsAnJ6lCO7sOAIUY7I8Bkjq6w9mmxyco79P89SzU1lulds/MLGHjuPWPSz
         wjgHJETJ1OynrBf/3r8r6kwNJG4af69oBA9CsMiU3OfKUNE794E3aXFy7qmxge4gBq6y
         shQCbRbXc6c2GW4SULlLdw66qXYEtOBon73DJE+XpvfaLXlw5NASXEQ/blvZjMxQ+wKy
         nLg8Pn428a74y1nNUXKSD/6IBaqkN2bVl5kUhov5ArKvdNJm+WQXgrYoMnBhVP88G8Vd
         Zobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927234; x=1784532034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mUX26WpwvVrJFwxAmnUDIQNXofqL2zgl9QzvPbM33SE=;
        b=XuTWCoy90G0V8eQwajpadrFPrmt5u+gnsZnhUvEybdfCHhGECjKrxoAs3KSB6CepVI
         JYj0Z7MasU+niLaGMEf7DnJsVFoXNvVJ/IDygybeKpwKxkv6i1wbUnFk59bxGe/AaVH5
         /sKXOQdc7Er6+QjeLDR9XGH8wbUGMMdSvSeLAiUrJo+cefFjWLV2gWfV0v+JQ1HSVb0J
         zWqvCp1UxoUuaen3Pk6V8u1ytJuISvHxOZHryqJ5o/7btiYRNUDPFSg9DIsoCnjJxnNC
         DhphO2f6kw8eioRJ29GAZ1CNDo2cHEzr9CYaRBnGOvJseogT90jExbpWw4LyoHtsijwG
         LLLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqg9a2yiFqZSXaeSyR3gXqDtaFNzis0AKlxYor6eMtkHsuckp0lwibPWuIUwtYeI6+v1p7Fotmjg2JShBFbwWMo@lists.infradead.org
X-Gm-Message-State: AOJu0YwX9mnxLJkaxfZkdRr+tdQwRHeH1HerR0myMjVVeRvv3ThANjBY
	OXwDG91kci5nFLYV2wIPoyMwz4a/OhAqQfb+py0T0p2vDC0KeI1a82xS
X-Gm-Gg: AfdE7clLFcwxAvPR84v3Cai5pHnQDJKDT1R/JPrbsA9pehqC5jaQLG7GVVR2dgYj1Os
	MqqMIURfhOdzPu2PXgFLL5/2MqPcQYcLRdCUoPGjKpdDimFe7PFWdp1AOE9zGTPZvUgW1DGmc/h
	CAoSW/n2eismgmnQ1WNpljHsHvmSy8IOapINpHCwfhw+bE04HD4zMh+YH9nRwyYCJvngK1j0S7T
	q8vKW1mtrAppk5/GaT0QUzgbgtcmk5LkdFF2f4oJUYyYD9X66hQPav9A5D9CVEOEiofFF/hrU6m
	bxP3oXZgbjNLzQwXVyE5r8xB4ZyT1Mu5hSWBNcDHi+VesGXJmQCCjr4DQ0bobcE9vHp1Ceqx208
	uoU5+U9NBBXPgx0Z41B7kY4tUZvRNIf9GvWD0jhKcM7xWNmB3iF3p3pAJEgrmziPbFYr+/MuXkI
	WXrUzY2EUUfE+a/5zRa4y3Rv72iC4zEbjSrW21HbjkqmlLafPu9w8ddEnYmw==
X-Received: by 2002:a05:6512:230e:b0:5ae:a4a4:b6ca with SMTP id 2adb3069b0e04-5b023d12238mr1708807e87.14.1783927233848;
        Mon, 13 Jul 2026 00:20:33 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca55723sm2625636e87.35.2026.07.13.00.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:20:33 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 13 Jul 2026 09:19:57 +0200
Subject: [PATCH v11 1/7] i2c: core: add callback to change bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-i2c-mux-v11-1-72bb8af8ee8c@gmail.com>
References: <20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com>
In-Reply-To: <20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=utkdIrJtEC44DqqTUyxORrRSv5x0AbtRsT4oMW64lXM=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqVJGxwTjAtaPb0x5drXc0YkmoWzNJ/oOfKfU+v
 Up1Vt+tNK6JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCalSRsQAKCRCIgE5vWV1S
 Ml3vD/9bNNLgaY8rXBnkrdoKHbiEb1/KlJz8oezgUw8JKMycE6i5sYg9soeiO7PosGFTsdXXEiV
 7z8Ff+3WT9gywMHcNHEnjfDK3XzJsUreSOK7pe8qsmdBFsxA5TMn5dUGj6a2KMVYrXB1qrMXqLE
 Lkg1zc7KRwXnlm9fe/595rL0/4YD57hlyR2XPUyAsmomk2b7q2vj5LwoTCOkDFOvqMHtDOm33bv
 PLurGaVJWJXRdSfRbtSCe3RMNuBrNolJE6JuRJJakIWtzx6funBlavwO+Qif9sOYX1uOKoKdGmj
 4XbLzxw2YwWpo3tgEtu2WIcwTW+/tNAQ2gqV6CA7fDBMPXSElclnAYXk+x0DFuqeAP04SfDIvh6
 eiKhJZAaG4+92N2MlcD4llb7ZK86bkigpmGlOhZ7OoA4PpJkoGVLJ4BADpKkYY5SpBqA+jew7Kl
 +OyqMnYZ9Xm9z+J1jUsertIuZS12CLPEc6VwU1oXbyijaPbN9djHkdIkLKy2Zj/5vAfB3XCH9Es
 fypF9vGE6zGQWXjr8uUM39x2Ra5WXMSI6kXCuF6F8WLA6dkhLI1FtDH2As4D7gA0SrhrCFx2dLF
 B9xjAlyz3Q/Z8gXfyEFA2KjkStyfrSYZYJ0DjEDfFdS9TT/vj2ipv9CVRyeoNvg6lIcTWhpKqe0
 1e6ya2D9fiWDixw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_002036_362345_516FFBD9 
X-CRM114-Status: GOOD (  14.91  )
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

All devices on the same I2C bus share the same clock line and the bus
frequency has therefor be chosen so that all attached devices are able
to tolarate that clock rate. IOW, the bus speed must be set for the
slowest attached device.

With I2C multiplexers/switches on the other hand, it would be possible
to have different "domains" that runs with different speeds.

Prepare for such a feature by provide an optional callback function to
change bus frequency.

As a side effect, several bus drivers keep the bus speed in a
private structure and can now have this value stored in a uniform way
instead.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 include/linux/i2c.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c..c5ba07f03ada 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -729,6 +729,9 @@ struct i2c_adapter_quirks {
 /*
  * i2c_adapter is the structure used to identify a physical i2c bus along
  * with the access algorithms necessary to access it.
+ *
+ * @set_clk_freq: Set clock frequency for the adapter. Returns the actual set frequency.
+ *      This function is optional.
  */
 struct i2c_adapter {
 	struct module *owner;
@@ -742,6 +745,8 @@ struct i2c_adapter {
 	struct rt_mutex mux_lock;
 
 	int timeout;			/* in jiffies */
+	u32 clock_hz;			/* bus clock speed */
+	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_hz); /* Optional */
 	int retries;
 	struct device dev;		/* the adapter device */
 	unsigned long locked_flags;	/* owned by the I2C core */

-- 
2.54.0


