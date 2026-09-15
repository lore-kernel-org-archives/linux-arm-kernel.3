Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA1BC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 01:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCRBWGGFnF1Ry6hzDyS1vYmZsFfXfi71bfZ207Oj8vA=; b=5BwyP/cJDzK5cGioBpfG5Pzsw5
	YXQVLbCw9sziFrxpv3LDE1UNuqpkibcWkPVQz26Vd1zLJRTV40soy3wjVd9w45Su7xkIjnK7EQavx
	8wR1KyPwTUOx1pMuT4qFxg4XgJBHepp8Q6uGWPOaYiQj0B9iJRx3FWdzS3RmWYAnY0ItgBMBUyKEI
	lW/yXAji2ruFesC8BF+NjSt2swnwVw98VNySpuu800bMoCy8ZIOJEeM6u1fmO32pVfWw83TD0p2AZ
	tahLz+qKxrQElW57MVm4BHtbiI+EErCJezi+1FKUvmKiLCltzEIywJTM5EYZYki3xX11CvHo+Aqc5
	aMoW/ZkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HqW-00000004wfR-2CrC;
	Tue, 15 Sep 2026 01:20:28 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HqR-00000004wes-3CSy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 01:20:26 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-91058dd77a2so41596786d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 18:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435222; x=1790040022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wCRBWGGFnF1Ry6hzDyS1vYmZsFfXfi71bfZ207Oj8vA=;
        b=Ox32piI/hTdXoL0dt0z/sBPIveLvV9e9WNL3DLEb/MVRvzkmgFpEgbJcI7/5QDajMU
         Wxl0YfM1LiVpeOIwxXoekD6II5635BfaD8iiXbpcbKtzoYK8Sqlm+vpO3yTiy8zup3tx
         EYO9Pb+UxZGga6xmiaJ7qsPeTtcz3xHmX2EmNiYbxFHF2JjxvSQBuRcPv2w3/cYb8VJ8
         dgUaQYzMcD7jB2hQfwgvjj5PE728GCns2vL3cO4w0WFjulOWwjNLt6Cv5/DsmhRxgI8K
         GfcrbYjrBcQilq8Zwi40zCN1vYFVlRzOqb+21QPg+Vm+uXi4abcTvJP3I972JBF3Mo6I
         aikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435222; x=1790040022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wCRBWGGFnF1Ry6hzDyS1vYmZsFfXfi71bfZ207Oj8vA=;
        b=I3Z0te+fxbocxxswTHewjdVDcQIVV6p9NgvNG2PgX2IW6Mq2QV6IKBjCsUqY8Nnb8Q
         vPl+auyFA4lJTBJWmeBTt0/9E+iSMQ8yKVAkX1r8aHUXRI2RGEYp6rGEdKYCxzWR4wMw
         yathLEZityH/hmpL1RU+4ATmTnxnQwwx2K0BTLGDXEjIv37GWnfV4LSZX4GCN4q+ByEK
         rmJ464go5G/tcsTLYLAGzGx/WDDsNZjQ5hcqtY/WTRcbneL3cL4385rE8CfpuKRt5Yln
         DQxpshvhLaKt3wheIZcYxwExwYt83SOnh0MGL4yaS4QrAtqWTB2AK2DpzOmLkcXNdK0J
         8leA==
X-Forwarded-Encrypted: i=1; AKwUvBxJ/qWWXqCXaiJLTGMBPLfT0epzOvuwACMGP4kIHa1dUFixZl8iyQ4jEOlnQKLqMQRUFuuA1XZ1YOFKkUoAAoqy@lists.infradead.org
X-Gm-Message-State: AFuF++mSCFiR618wb4R4wZgAIZKye//p299CZBzBUQp7cQAMu/12PAKt
	qmPSxEAwA1zXX2HRmYOb3vKyFj610yPFgH4Dtt2HHSuPOJ0/kBLE95nUM+8sHVPVTA==
X-Gm-Gg: AYBFou12AaRSoZLLnuJwyhPYxyNDoTfaP3hFVrINm8rBBTW+Ax3QtakZI/3/wF1TlS4
	Xid1bVPXWyh1HjTzXd1Tx5UejhkYrOEZRcLndIUwLqyt5QHcn2l9zyxiu/+BhdGAHjaSvIR5xS6
	lrvx6m57KkNehYUnd4cou1NAvKzcr+NXusggIsSzNH/qXNz0u/Hga05sLLLD2mLtYSIEChaDsAM
	iYt606B9PSjPdCUcoK/90beDNzUkwQ1s6lkwdJ8zu9yFrax2FqqzaFOUr1g4VqfozVB5uRDjHmd
	1NM7ZQLjFKBQmEWV81caZGfbtFvJO76tbo/eWaBQR0QqtgJalnO+uZ/gSj9G0P/jr1eKxkggYH7
	iuLLsbokcJDaGlknxNkb/7RaWbsPiZ0dRcoehbcRVDXyt7bayt2bS0f55w5ThFgj1OtJksdpLb1
	M+f9A197ltHOA1FwqnuXZJredhxuI8y2KZj/a2W81/EzmkgYuzgSOXBFqp5mNm8U4AF+emRFAWm
	U89VxLWD46opsi/7YqMuVQ5rBVNDwJWxaSU4MfwiPK+x3QAKBpsA8so7Pvibaw0fFSjOWh8JVRx
	rYvKKT3zNcn1NHm1AVLt8BrDn1KbiwANhqk0YSRzRzn6TfZtNsXDUo2/IwZGbsi8g+L9gtIzhe8
	4mUGu7Q==
X-Received: by 2002:a05:6214:590c:b0:8f0:3b98:d6af with SMTP id 6a1803df08f44-9122e660530mr96067806d6.26.1789435222335;
        Mon, 14 Sep 2026 18:20:22 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/4] usb: ohci-da8xx: disable controller wakeup on cleanup
Date: Mon, 14 Sep 2026 21:20:08 -0400
Message-ID: <20260915012011.61874-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915012011.61874-1-mhun512@gmail.com>
References: <20260915012011.61874-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_182023_914927_55EF9092 
X-CRM114-Status: GOOD (  10.78  )
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

The OHCI core marks controllers with RemoteWakeupConnected as
wakeup-capable. Probe enables wakeup, but neither removal nor a later
notifier registration failure disables it, leaving the wakeup source
attached.

Disable controller wakeup after removing the HCD on both paths.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: a6eeeb9f45b5 ("USB: Update USB default wakeup settings")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-da8xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -447,6 +447,7 @@
 
 err_remove_hcd:
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 err:
 	usb_put_hcd(hcd);
 	return error;
@@ -457,5 +458,6 @@
 	struct usb_hcd	*hcd = platform_get_drvdata(pdev);
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 	usb_put_hcd(hcd);
 }

