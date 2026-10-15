Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E72CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 11:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVKbslMBu6CF5quy/19Uyj5RN4onsoLySqMkVldnW5c=; b=2xT2YITbhlaXR0ytQwcoHVXU3o
	V2j5Sd9HQ5L2/4asT5DAmcbDiYDMzVKBLCTtsOe3POdLAcHNVsOhuhZv3BUoFIJyQuMlQ4Yd4EVUW
	BwI6OhSeSn9HWQ8e/4+INVaQFB0Cu4SDylx4vK3pNA9Pzz44MCC+i/JBJeP+zY5OQv1W05wkfuaXv
	4mBgfUY0amSMPEeLA6aA+Q39U3xtsyqxz3G8BINYRE0LNxT7Ti4xo+O/p3fDommVWZ25C+av5LkMT
	cz7gm2gILYKiiZAscEXcGnaPxDRQRxTteqD2XBed+jqKSC43GAR/UWDxAzHlU1/2/JPkeOL7WreCJ
	TONBmClw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJEe-0000000HVkq-3cwO;
	Thu, 15 Oct 2026 11:02:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJEU-0000000HVfE-3ThE
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 11:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rVKbslMBu6CF5quy/19Uyj5RN4onsoLySqMkVldnW5c=; b=XrYgy2Px6h5W6CIimjvyHB9sJP
	zN90Q4emhSxKwELS48IqYvWvOvUqj1Ietq60WZFFFXIwmVrzUlbq/HKtXKQhvyGXLWtFMMgVN4ya0
	o+f6vJ0VqY+OpaJHX7xE60n5rtyjkazLNZyZkas6lQnMx2JXRWcNKtDKttPruAslN1N0LXjfah3Or
	2swCnvaF4v3KNCzDPOdfZGgoxgGPOo2S9D8Fg2V2bcUCgk9ry9n+O/gO/SSQqPMPEm+0+cxVSA1sz
	JZRfBYIMDHPYhqzAmyOIY4DaJkoD5LcIdwr8mgZsJ3A8vzcHuw/pnq+B2E+ZHdACUb6xq3aYLhjDt
	YuMLq5IQ==;
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHJEQ-00000000HTx-3ed2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 11:02:44 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so390660e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 04:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062160; x=1792666960; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rVKbslMBu6CF5quy/19Uyj5RN4onsoLySqMkVldnW5c=;
        b=FLG7mhRWhdAWSWBOpLK/o6rPDtRIbeTIZpetp2/Hn4c5wF3lfUWwCjg2x8o6s3Bh7C
         5mWjyszh2b2QSdSzOX5tdo+Px1j8CGqQh9OQIWtBqxmOyn0h4Kju5j9sZxXuSaxOM7qB
         MA+7gFeHWzZw/Bnx3XMk4NX4j8lGzTmdufPyLhqBfnsfayHmMehzSU7L0CaeIwzzPy0H
         dLsEeAeyzprNrlb4CO8v87F/XfD7oJF1fXch0aooW6zaGWfcxy2/Kby4AIyHded1YdvW
         nF1eIsuy/nm8cX6a4F4fFSFTQXCxdeRh+P1GD/muJ+b7D4ZiKyWnfJ3sfaqa4NhO8mY5
         V86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062160; x=1792666960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVKbslMBu6CF5quy/19Uyj5RN4onsoLySqMkVldnW5c=;
        b=gYR7viWCKylm22SEWOgQj2lx/14P1S7wqa4SgPz1FyNMuvhfAQSQTFZTstsj5Zm07c
         wCy+EmGrX53UuafAaGY5AiiKytg5s8Vw5RZpGZK2M+nAq3yXulYuAcOGBu+r/5pD+7rn
         lbuSzZ9M+tF7T1a4lYKC3CMQORfhwX3hnReg0mh0c/ey33PZycUPhZEGH52PR1aM6pOW
         KYMGnSQdDsFWKHMQyyWd0Hc+4Dy3B9WRJWio0zDxg3VdeQg0VUtpKbgdSIGNx4bMhBOk
         gwxTaNlPLbJXJB2RAtKDlRrnT5ADhJEDe3D/734zscDh5gsZ4AAluQXlmjwMNjL7Kj93
         EX8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwvcsWrbWVSi0lLRDpCmiJQgNihKTGb3hPUA2HjaCNYPdnQTTBcocxIGn1nlQEDviHqr3c/17IhEcPhHNWgJhcY@lists.infradead.org
X-Gm-Message-State: AFq9FYKwXW5UCwYZH91SASBYTJPfF0fqsfaHooA8xEuTeaPq0r3LW7SV
	0KFVqx+OUWprypscUy+lsZLLPKUjhmGlmhsHGj0Kb8sW5vXTQgOiCZQvFVbsBUaS
X-Gm-Gg: AYBFou2cr97ET8D3ytEk31gqvCnHAK+Ib2/eN4pZjR0joMHMIfKI37TVE+hwrRhT9mD
	vWbPyG9Lr+akDzB901E2D+Bx27nMMR6BI59XNk2gqbHtMRPf9MzlWYJC6vv911J98JgYLsaHjdP
	3Z0/Dun3ahwDbMlJCofnv78Vhc0BxYCmwZQX1S9i83tTmWVQx/uaaEJDjqfYaCPcs+yAYFhXmrp
	6P7MIWOYsoHdkdZEq7GnY7lgebSDnvnbcSViIfHx/XjkGnH6ncLbmg6s5WwnLKtdNZdxY5j7zM9
	V3kCzcp/wYr/xQk4B3cvT6VKtTHbUZs6XVzO91ems1FZ2TNVgvI+Do1d28w2swHcDGBvfClHBzo
	18DtqPQjty5MKx4D//fP1Wx3fNBsCLr8wG9mwumTuj2P2hEaKvCX6uJFi1jUWMFQoe3qHP2lJHH
	d8GumKe2bvCwRDufyV7g1ThWMF1hBTeiPcCU+6AC46jYS/b0Yl65McDSusGGMD8o1qQbfSTpPf5
	FO8I9z8SgkmSxsWVqAWv+li8xH7eSF4uqjIWCp+NT0W2Q8xGSC0s7sNIlVbqg==
X-Received: by 2002:a05:6512:110e:b0:5bc:ca67:c343 with SMTP id 2adb3069b0e04-5bcde6c7391mr7040404e87.28.1792062159834;
        Thu, 15 Oct 2026 04:02:39 -0700 (PDT)
Received: from [192.168.1.135] (81-229-40-193-no2450.tbcn.telia.com. [81.229.40.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3739b5d1sm905465e87.22.2026.10.15.04.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:02:38 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 15 Oct 2026 13:01:53 +0200
Subject: [PATCH v13 6/8] i2c: mux: ltc4306: set correct idle_state in
 i2c_mux_core
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-i2c-mux-v13-6-778a12cfe93b@gmail.com>
References: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
In-Reply-To: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=832;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=zngBcOzPJZNXJXBSaO+Bhwj3certzptc+V1LRBF/HJk=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBq0LK7uxsiuf5sSWuXq08m4qXSSXd9tuLkxQadi
 el4mHZgHKmJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCatCyuwAKCRCIgE5vWV1S
 MuSPEAClGqQeffmMOx41qycz0kx7UJFVmXuNT74EfDW5aSAK0d72cYbdTBkpngz63r/6jBZr00s
 xVd/Xahid1XaEr7Hib9vyhUn0GK4R5FOPiYxK8Od8iDa8SiEo4r06Wb6AjwkoTSFp7UWax3m6Tt
 jZ6l7Di5M0tQ+aHjrd+or8pyJfomwn8ouf3lCq3xuz+cu8DNobGA6c13ClmsdEMdgDcL3MRPUcT
 HNA3/Jz79vSVNq3p/AlFRNRKoZgzkS33TZtp0EYBqj0Iszym5vsQa6x+dkodnKA7NKe2IYFSaaU
 xHsaCDiDHxDkyuhzttaV++AEmqv/L9UofoCFBJtVWB3TSvCtXPWMLkeizSpTWe/5gq3rFpxKf0y
 v3rEPE/8i271U5VOKIS2uj8cJskgfgLmwZeXe6OthM+5gdgmkjRswVNHIz2z1zLjGcitZgdP9ae
 s0JfyL+yHjnpg1nNmAVl9R/YIQ+ixhtUHDNvectfRuXskocuYDiZTam+tF65EI0xn6DLCrmDdOk
 5+VDR0MQmCwp1pXwSkWpZsQrjbATZitOS5b2mzKU9HAor3qXh2Gzot4kXHH0JjAHzTltUkbbkat
 pnov1NOrg5f6Y1ekNvXxuYfWJ1rWiGBKT5RVhLP5KVXVU51eXaef8ch0Q41T3mVK6wHHu7owf/T
 9c3zJ7G07j0DNQA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_120243_164360_D710D4AA 
X-CRM114-Status: GOOD (  11.01  )
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

Inform the core if we intend to disconnect channels during idle.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/muxes/i2c-mux-ltc4306.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
index 18228f5b80e8..b1150a18ed06 100644
--- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
+++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
@@ -232,6 +232,11 @@ static int ltc4306_probe(struct i2c_client *client)
 	data = i2c_mux_priv(muxc);
 	data->chip = chip;
 
+	if (idle_disc)
+		i2c_mux_set_idle_state(muxc, I2C_MUX_IDLE_DISCONNECT);
+	else
+		i2c_mux_set_idle_state(muxc, I2C_MUX_IDLE_AS_IS);
+
 	i2c_set_clientdata(client, muxc);
 
 	data->regmap = devm_regmap_init_i2c(client, &ltc4306_regmap_config);

-- 
2.55.0


