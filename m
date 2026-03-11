Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00A21125875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 19:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMLfC50swTxVVqIck4nOrGTGoLiTGa8vSDXPzAV9bIU=; b=1eLAdL5TBUi2EZv2H4XZsiwfio
	kX4KiBE2J7UGziTzPenQPzkHniADqsxHdNxu9ivpAKgyffs1TtOuLMtMUC7/vg0JShgE7whV8CIfk
	ksiHW/YsGHymqL2nJ1v1hmQKNvH33IY+euzWxZVN6mNUiGNeAua48pLYkcIqjiYZwSAHNnSuG2ugT
	WT3uJExmdXwLtcNFlDEb/u/FLc2a6lnubaZVT3KuMil5vb4LRpY8NBK3uzoQoKXj4rIeKk0kFiJJ0
	qxFyi9afkoslHKhQOUjpXZ7q0cwXYj+rDS+tsBRWVooxXJpZau9RI688PWmE8LmN3pBun2lk891cF
	ftHzN0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0POh-0000000CN3K-0xfA;
	Wed, 11 Mar 2026 19:39:11 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0POe-0000000CN1Y-2Exd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 19:39:10 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so198482f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 12:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257946; x=1773862746; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KMLfC50swTxVVqIck4nOrGTGoLiTGa8vSDXPzAV9bIU=;
        b=ALeX4o4egX9auFjIO4pU5Ibvzxw+xhh4U+TzwALYH9TbOBghZJ9oPtHohWNbLy0US6
         1rbV8jPG0iJeV0eqseh4yebVaQYfIRxAY1CgCgCX7x7AoMY2Eeha/o1tOB0bVhvfBjQz
         pPvW9dXwQrW2XBDeaqcl3LcKHMKh9AgGOuguMSCoxnvG76XQLwG7q7yz8ZQsJCE6MJaJ
         UsLj5iV6rlJ2Mt+i9OnAuzZsIow3vUMMk1Jbc2Thrxvk/s6VuW06jc915+0ljIk8JmlC
         BwjjPQLIq6C8jkXB0Ly26VLUG8e+g8C2xvD/9QJ4kI0L6V9JIwgPKuRaKMGL6nwyswb5
         G2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257946; x=1773862746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMLfC50swTxVVqIck4nOrGTGoLiTGa8vSDXPzAV9bIU=;
        b=laemdnSvuinOy/13ABl85CaY1lt8KfqcFJvPYLxoUTaJlf7KvlEOP3npBhkQGhLykl
         sGXO4xVD5o/qWw0Yx3fUyKq/1G0DOMHHKjB9sJ/J0f9xZfZHXKMr2j7Y8rFNx8gRBsCN
         mIljUQur+p5l11obIREJodhgtL/vGqBXTD1Wy0WiXbTF23qnh96jKwY+Rvua6dgpTf01
         uv0auZikGV5XiO4my3RnQ+xGZixtcGUfQOrhatPVQG9uU7u1i4Jmz00R7h8odPHWdi8/
         QIy8fvSnBJZYJayGxIht/+3lSryPz4+T0DQMeLNS33zTQisZE62lsVTrVRhby4EcFxJJ
         YFAw==
X-Forwarded-Encrypted: i=1; AJvYcCUfuGxra9jIlyPPubxR5G/yzJWwppzxyR5921brORLYynwXMkaChDfJEDbnXhXyg2W5wJnskfF87GZWVw0uUfPU@lists.infradead.org
X-Gm-Message-State: AOJu0Ywreyymun2T/b7BzJdjbwYCe8vupWyplS7afoFgpjHCeWT0Q+Qc
	SYFzaW0tgpKxCv8ZvABAAj10ZPMR83T6EYoEM/5naZ9WAj3rLgZ5iJNFbLDFDRYELn4=
X-Gm-Gg: ATEYQzyC9HjsU5eUfHIq0HGshS2ubfdn1aFJwjMf0XDRxLv3qP062mK4bVjvflUrowY
	l9zZznMkyiXtF0QrDKK6eBE1T3gXGXK++PZ9u6pRMO3ZauE4LjLikgnl76At+XpcdimwKDKttxg
	D9nFN4hex22zgQUoH+TYrx0DzGZ2PDbIACUck0nB4ZFNP4z+ajVHulzQaB7yIhFgqinx+OlBoFU
	rx/+ctq0Hso4z/40e3jGOhalrp+Tk+5h2Mp3rpTLGEtFJZhuM1IvZGutO6QtejZlpdFS3RW+HTB
	Wl7N3LKa7+rUGy0m2XUH6KlHNSFsYG9EKwxAvPSfJAA3hBjPXP4l9G/9GQccYjMfC6G5hevZ22y
	eKw7aLv3/vNzc+i6xjmtciaz/Sp7CV6PbHexx8Eb6JT2hZTrcUKiLgNO7rmL9vVZp6dRMLtw9Db
	zhVdl3ky2UNFl7lTvNEa+nxSARX1Rn
X-Received: by 2002:a05:6000:1846:b0:437:6625:d0d7 with SMTP id ffacd0b85a97d-439f8438f5dmr7101833f8f.42.1773257946416;
        Wed, 11 Mar 2026 12:39:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273e8sm1655600f8f.33.2026.03.11.12.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:39:05 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:39:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 5/7] arm_scmi: pinctrl: allow PINCTRL_REQUEST to return
 EOPNOTSUPP
Message-ID: <e10b198aa9ed7a9cda6d0e9033a00d1c700ecf9b.1773150895.git.dan.carpenter@linaro.org>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773150895.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_123908_575684_F5109A51 
X-CRM114-Status: GOOD (  10.89  )
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


