Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1620DF54AD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 15:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EF8mh8aKz3LIz19P1c3H9JBQd1g9ZFsPluy4phQ6zIg=; b=uJJsFEs6V9iutDfE9evEWNwI6O
	mNh6bvISswkzlLRc+pSHS7jnZcT7y5xkLXSu1RklQNX7PYssdPRQgDPDibxg1zice6s9JqXxCwC+O
	cvEzwArS4RT3x82MHL31EBQoG+qIABT8kMEbqxXktp6s2s+oqvqaA9vREaR+7CXDlDtiQA1egA3nm
	OefywoNlRHpzM+QQKedFPFLbUby6Ln2E+X2QXq2HINjtPxVYSazzjSjM+b8fm15U7aPrF/7SJgajM
	L79mJdobF1qEEAxkmdtuinHnZrTyg62JjXURfvJ4Ze3SS7T+rLSiVrU5HI0jcXMNwO240c9L6hW0H
	vcI2juCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53J6-00000001iIw-12rp;
	Tue, 24 Mar 2026 15:04:36 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53J2-00000001iHQ-1LRr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 15:04:33 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a2967e5de4so1010657e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 08:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774364670; cv=none;
        d=google.com; s=arc-20240605;
        b=Bll4Dlx7MNwd8U+VB6SreYOZKQfMOTNcO2N7iqByv4g2AoR9npVofV5ftT62McgycW
         quxDWMclsjVt1RhdreR8NRQaTE/4B/psN7ZmwKYgHhZRFX07eHigOkVke+3EWwyMrlHU
         8u4GfqncYeKH37FYoAb0Q1Mbp+YyvvEcuHgS6LvjBkZ6Uv87rhPpP9oUIxEMXOOdFmlM
         H+qA04NsmSPHejftBm27mk6evY1zomZLuGltO6LJQyiWld+MdeKKg4kalrsK5IdTnhwz
         mLeFwnkZM8SQE3dRCdyFQgXjyd2/XWwxprsc6MbE9PUYH3F1l+U8iYNDHNaLEM1//q2z
         796Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EF8mh8aKz3LIz19P1c3H9JBQd1g9ZFsPluy4phQ6zIg=;
        fh=4TCD4p/Ha3wId6OPujmX5XKXp/+hGIa8Bl+apbuviqo=;
        b=LYBL2Tc0BTcXcie12CcZw7jd+yf6CDcOVtUrR4sORAq3FKfmdP4UBOo+IsvtKmEs+2
         6oHemXrSKQgV8qJF80S/YTkhRVCe4AW5EUchemt5oev/EwF+ITSdCTOkG5MvOMYThwTt
         NKhB1yUQC0Dc3/SgH7RPyx4QazCiNb8TN8kln4IJMA9bDTTRPGuhDBCXmsO1L5/j8hMd
         /K698SoKMGS0f1Wns5FBp7LAshJwmtgluarX7bW9pSzzPHND+Oa/ytkn1uLU7QdLdIsl
         FB/agdyjOoP0t38lOmLLruH+OyQNhYhtp6y9tYQIwHvEWJSrOcmzvtIRpHiyghkPD6KQ
         kdiA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774364670; x=1774969470; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EF8mh8aKz3LIz19P1c3H9JBQd1g9ZFsPluy4phQ6zIg=;
        b=F7iqfxECKi9RL3U3jIM12OxG9IWE6AyWKCmWyEeum6N7Jn3MMWjLxw/OsLoiaJiETn
         TBTaK9M+nWk9cHOr1AMZ4aWAEnEn7T50lg2bG0J4PSaXiRxw0wKYt5ug5ocERXL3rXqa
         ooq0ph89HdN/+5+XKxm5//pXAIWQqTF0TCaHfxR7uIBz/YDhbPrb+YVLikWL+geuY/TX
         36Tt3cNLWQk8ac4+UT+c9mMRuyc7N2X0w1tKfi2a3ESVlcDJVsMYiyVyT3M922k+8NIk
         JKAZluae1StssZGmLrjQ6cN2H1+RWDrP8WONN3G8sTcmJIs+u7IHxw7Hvh4lmc3Gd5No
         48lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774364670; x=1774969470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EF8mh8aKz3LIz19P1c3H9JBQd1g9ZFsPluy4phQ6zIg=;
        b=Iea9/JBbeGWXYRV+/xeERrCdcLInMWrsWd6SWZyhrLFFXFj0rULhDKMUhhIH/KSSzD
         YH2gDiPO7qQHN8JMAeZEJ0vauf8Y4zdcp4+VWZb0rDin2zr+nnN4KsJEFTwzk6T2agye
         PUHJ3thTQzK+1/c1y8BxzPOT5ppEQz3BfOfcQPfPtzZIEPnauSvG4DudQRNTYOX+EjTf
         VECYfJ3MLNOhuznx2y3c7hO5oE/vLHqbKpKpUp/whsjnv/cC4J3I9Q9DTyUEKVMTiBj6
         QSsoLkCcXlYWN9wN3n93wpW6RXi5ueezAYs9z7u1bAnr89CoroWERH0OnWrvQa570xMd
         7sBg==
X-Forwarded-Encrypted: i=1; AJvYcCUaePOBwC5sMOJmLdGW0jIc2qc/uQ6/fPiMel6e9k/pWL2SJxJPLE8lxT7QUv1YClQmJm45NAVg8lRogb5QS1Us@lists.infradead.org
X-Gm-Message-State: AOJu0YyL/TKnc9FtkQvxgrE773G5TLyUxj+mWs/qRfwLQ4Oq315QSA8U
	NCCplZTXrJ1dpz6eNFDvUXFueCp1xErteKQVmOuKCB6tNj3wm6Il3c8ViibzhCF93gzdydU8FF2
	NtM97n8FbzxI3tBPL7LwR1tBh2hei2mWgKqtvK6Rogw==
X-Gm-Gg: ATEYQzzNcWBw+dgIOoRzmESS7wfpmcS5SjFIN3ZySJ4EiGMP7fa9cAovMOQIpOaKgWQ
	hBKyBZfr3Z9Q6qVZgzzQLlkNi5QgFZ78HUGf8Ht4fXuTmzHu1LHR0sxuI+174czFQE1OGCkbYAs
	3TxuYfwTm8vhler4eEsSCDFFzJhERhmsxDgpYxsIAUkVMGJWKumx7aZi3r5xnJJ8XwMTt/090hs
	GJ7aXiMihYGN8hj0gYgUX7Wj0FEVjmnHHNjXv5Qn78XUIC7kLNadAf85kGKOu8Pq4pRExPg4Tgu
	NCYsRdgA
X-Received: by 2002:a05:6512:15a9:b0:5a2:7d84:6a44 with SMTP id
 2adb3069b0e04-5a285ae4b8dmr5600779e87.6.1774364670294; Tue, 24 Mar 2026
 08:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260324-sdhci-v4-0-c8c2060ccb5c@aspeedtech.com>
In-Reply-To: <20260324-sdhci-v4-0-c8c2060ccb5c@aspeedtech.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 24 Mar 2026 16:03:54 +0100
X-Gm-Features: AQROBzDGb2O61nTd0QV3ZdTm6lrh7bdMvQHr7qGN2e1GOEsGjRP5W0BZL_IWEd0
Message-ID: <CAPDyKFqwCahQCw7kB495Ym1JmSkn0PAkXVn==oV9_pKcb9zj9w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add AST2700 support for aspeed sdhci
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_080432_378039_76857429 
X-CRM114-Status: GOOD (  12.69  )
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

On Tue, 24 Mar 2026 at 02:58, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
>
> This series add aspeed sdhci support for AST2700. The AST2700 sdhci
> requires an reset. This series updates the binding and driver to
> support reset requirements.
>
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
> Changes in v4:
> - 2/2 rebase git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
>   next branch fix the conflit.
> - Link to v3: https://lore.kernel.org/r/20260323-sdhci-v3-0-93555b8f6411@aspeedtech.com
>

The series applied for next, thanks!

[...]

Kind regards
Uffe

