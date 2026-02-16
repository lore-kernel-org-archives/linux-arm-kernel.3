Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49875E7BDB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 12:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbwGPJS9piP3D1IROOiA3tAkFtRzDUpcLnnixg8UsRc=; b=olAHTU0ViVG9hB9o9+gx4Gznbk
	j1hDjB4UfOTUQNG2z+tHOUA3mzhNOumDUv6fHCz+2WNKY9KCnzsK8Us39zmXPMAzARuuUkKgKapr8
	lQTwhIkLFNBUK5Vi/Jj78PDJz1VzGdZIxuDJ9fNMe2ooY0RlmohWe8pUpgNCzNZ8K0SfuOjxNprGb
	Ed7LBFnclxo8kbFHvCq9mzKhx6sBRhXGcyw72CV84G4DUTTvV171xP8uAerZ8tQ346hn4HVWiIENz
	hwSmBPl1db3hvD9V6l/aRe9KP8yMlaU6j2tViuu4r/DAMwtD2kMC71dpDFE3v/oJuJtbQk/kgVg6T
	teR4jMPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxs5-00000006Waa-1aX2;
	Mon, 16 Feb 2026 12:38:37 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxs2-00000006WZR-3gvp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 12:38:36 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-59e63b427aaso3402659e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 04:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771245513; x=1771850313; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JbwGPJS9piP3D1IROOiA3tAkFtRzDUpcLnnixg8UsRc=;
        b=EY+1WlGSQNGpodeisC8dQBWdpwXIynoKcKPqbX3xKK9D6R2x1yW2cKSA2MwfuI1s3T
         xtOyTpl+m4V7P48FLx5kHRn9zn//fyYFWI6DI3H8xiGuzykL+g0ei+6lgnLXxOhYR8a+
         PNFsTz1tWaZxGJ9Pm2FLOGLKGGNrjYW530MH4Pbn4xuYanB0Yt64yWZS/U3/cBnViLVJ
         Wpq3vgRhlqVjNs9nqZV4x1CAtlTDfKTaHJpFYIY0G8oLFt1Ux80bgoU0KVGQ+hBNcusl
         09i2rEuled7LC/66ekhQ96zEUN00/YMCx5SN8sqXETXf1Pj5Qmv9VgYkhjLTuBVCVYp7
         DMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771245513; x=1771850313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JbwGPJS9piP3D1IROOiA3tAkFtRzDUpcLnnixg8UsRc=;
        b=Wkbq37zN4oXlJchQRPUP2Qq7We60f8zDnvT0eICKsb9HvTMLD7HScvvg6qGVrFPW7l
         +dgJ++339fsBuizn/zwUV8eicTkcX5bjeLbMS2/9pMfn3vC5BT9lmP9j3Qd1EpU/a3wv
         aGnuiKftjMklNVGMNY3zg2Rox4KXV6+e4n66EMGn+6I8j/JIzsTOAiUE/Ept/acXr+Dk
         nlIzZXi9ZSqHf1WejIO+yAuUECZcIPOjqhPhW1eSdU3XetnQYO6ef23NTsDUS9aSntgV
         lC1z+PAbM0aZp4d31fFc8R/5THsFH+4c8kvqlkLo60lGagJDfNLLhNPjfsAhMG/VuDDI
         p2Xw==
X-Forwarded-Encrypted: i=1; AJvYcCU9fnOovB9ixJregDcae0cyDOXeUEUPSqx1Bsazjn+xw/yySI+8kva/B3P8BmUK0Zi7NXDEK6+D1iCEZumyLf+U@lists.infradead.org
X-Gm-Message-State: AOJu0YxpGovleTERXCbRl8hkrsFCV9AldJ2hKHUtgmGnB1cziuMf/+7j
	4p+ZINgjVFfwInoPnN/SUedKr2cOmeiQkfrHOlf6YP+E/dVgM1cJQKj3
X-Gm-Gg: AZuq6aIpObep+dUJqjFjwWKp7zAbj7ORJYX2cPF4c8M2kzqTWDjh3E1OcCTP/yWa6vs
	zFq33Dda9wTQJvNx1ICh9H+Lhd/FTeDgkCY5DgcIe2EkIs2je7H1oQnZQeIYLV4+7SC2T5vOJI9
	5Wl0zhIzXPuOdorYbqJPzKdG4bsWbuncEjSh+SliAaJol6PiMwkrCpoyLgrcXtWDpFRdRumOgf8
	KkgE3Is1Ok+8iEYiTwP4EBCt+OBPd5H5TaHHraD/KDl6nm7hrdDXgj415Q7nYtDlgX2xpjq7Ggn
	pg50K4aLAOXSjF1kq3RdangyO0iQNDHu8h/5c0nUwIIJhZ5eEa9g7G6TOawlyUy5qMWlyQgWYW7
	lIUT/CecR1FMI8fUglUOt2EbRi5SL+1vzvjQKU/kQcZFPPtmPk8u5WkbuJoFflRalO5YJwASh6W
	xLMhq1DutGKAmzPYU+ybT9K8HedquVdE61RmKI2/CLH7XSXTxsEMgyUXs8J+Ws1iTZtGtM
X-Received: by 2002:a05:6512:304e:b0:59e:4f92:5df3 with SMTP id 2adb3069b0e04-59f69c3e23bmr3523627e87.10.1771245512608;
        Mon, 16 Feb 2026 04:38:32 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b0577sm3175920e87.71.2026.02.16.04.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 04:38:31 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 16 Feb 2026 13:38:13 +0100
Subject: [PATCH v6 1/5] i2c: core: add callback to change bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-i2c-mux-v6-1-9be28ecfd7e3@gmail.com>
References: <20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com>
In-Reply-To: <20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=WkfZrlH2rNxO52cLVhBbxQV4YB4czTBtNoYoTszUuMI=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpkw/D8XNVBduW5ufUR8JhzXfBil47yj9Ci1zpG
 4/9/BCAdEiJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaZMPwwAKCRCIgE5vWV1S
 MgXrEACCHJ+y+6aLdIWIBMz34AfkkMC771/Z6hrN3cqelZgrb9vN0zqBmObTMGEu3VadlDCSYc/
 2G7HIhieoPs4fGw6lFRrCCZJIasm5dYdjtijFatEYNAzBbBAESjBkgnZ5FQMPeBcN4UgzyqkXoa
 aVgxbBUkmyI8D/ogiGbk4GPxj9Jo0nPjIA8M+L1qmzQnErkUfcAGLPujf4XS2gmHeP3p3iOkuq5
 vCwvoDF8rGxxg1+afj2qFcHyOmxG5RBoACtOPqjgF5lsCH6CQLLMuS9JzhBZLR7266zwVy0iw0u
 RSf2j5WG/a92luoD7bYTsNgk00OT/ui8Jp3OtDEm9Ymz9han/CMpIBgguDihueQTfT94s0bkuyb
 ARzbB3lbgtUzbykrepTWPBnW2HnotrzpQkp/sNkylvmGy1iCxbQHNrkvB8EUL9RIRHaZxvGCaX7
 6F/fsdYJ+zYJrdPD4VfX/ZG63BGYDP6TkbgpLjsC8BA2LL5uu5jLY/d6YuZ9MpKZw/qjIQ+nykV
 DeXke1t1sMW2KzlP/2I3LPb2k4LT1x6GDXKEfLo3DW3wBrp6/12xuKlGJ0GaKiJxtpuZdUG2jru
 1LADLtBvuP5IbfTuWWsEbUW3vhOQAhQ0iKTcZcyQv3Xx8ef1U23u3jSa1gnk1IL797zh4O9nHM1
 f47YQotq9GW+u2g==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_043834_945037_ED35E332 
X-CRM114-Status: GOOD (  14.19  )
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
 include/linux/i2c.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c..87654fab2f1b 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -742,6 +742,8 @@ struct i2c_adapter {
 	struct rt_mutex mux_lock;
 
 	int timeout;			/* in jiffies */
+	u32 clock_hz;			/* bus clock speed */
+	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_hz); /* Optional */
 	int retries;
 	struct device dev;		/* the adapter device */
 	unsigned long locked_flags;	/* owned by the I2C core */
@@ -835,6 +837,15 @@ i2c_unlock_bus(struct i2c_adapter *adapter, unsigned int flags)
 	adapter->lock_ops->unlock_bus(adapter, flags);
 }
 
+static inline int
+i2c_adapter_set_clk_freq(struct i2c_adapter *adapter, u32 clock_hz)
+{
+	if (adapter->set_clk_freq)
+		return adapter->set_clk_freq(adapter, clock_hz);
+
+	return -EOPNOTSUPP;
+}
+
 /**
  * i2c_mark_adapter_suspended - Report suspended state of the adapter to the core
  * @adap: Adapter to mark as suspended

-- 
2.52.0


