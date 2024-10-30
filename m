Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3FFD5CC9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMES1QAhfgu7bIQDYk1EUlu+RGSHNt1/K65I4mR80e4=; b=x2Bv2RYWfMguFRf784adA44n/y
	2c68U5ZGsnsxlIRuGDL21mcu2+DvtRwloab8FCVAkx8M30F23lJj7qDssY2R95yCAODLsA1tHrUkL
	K/hdZyi7PogQCILq4vtVcgnSgsMM8PgzCxB8mQEN8ET5yIT8DMx8l4cKVv+iKexC5ixer55UDX/Bp
	bo1/9sFN7Cgrz8XqxnS8scgaLIENnfg98d1cj0en52DUD5zzbdCrUG47ossqVAs/W+Od+M/JMsN0P
	Innocr7q150Rudj+F6r9SOVU1Gtu6TPLhTVBQPeU8l/74+wGLarSDewIEd0ezPYaFe4wL4KxqOj1z
	roYHn3YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t678Q-00000000C7q-44BN;
	Wed, 30 Oct 2024 11:45:10 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66pk-000000007j4-0XR3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:25:53 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so64364171fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 04:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730287550; x=1730892350; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bMES1QAhfgu7bIQDYk1EUlu+RGSHNt1/K65I4mR80e4=;
        b=hGD7PeKodscfoxprlRtIveAO1uknHuPdzwFzvPEHErVQLiPsGdMf3sdtyBftnTiSmM
         emGriDA/wwOh4ClJyVCYgANz0fB6xzmWefjiq6BjDW75dyH+bcZCTPLHno3ZuJJLp4Rz
         7dAIOm38YYDsA5nmaAu9hTGQNHkQJTF43rqVAhbE5ehko7Dcs07OeLezeIC9nweBS5BT
         1iXmRFWVFjFTZQf+D+GNyF9+xuhr6h/AEuhaWhCcraRBUaPfoNXVB/AMqgd01wkTBEHU
         InhrzKBbBvmgdAbVPwbGZqfjb8RqIx+Fu3yOCTv1EgMkjBiEBJJfgf5Dr1agruRzbZGb
         4BEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730287550; x=1730892350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bMES1QAhfgu7bIQDYk1EUlu+RGSHNt1/K65I4mR80e4=;
        b=QEk9DwVf8tmEwuoDUnEbN/X6kzmBXI7RPhrcSYDMguPE/g0KoqPla1mZXNtiOu8rvw
         FNgqBBCZ5WnPt+hUQGDnxN6Ou3aLHZK7WgrZ6HsXwMcfMY8zgHX4mRHGaHigKmkINfKR
         EKKjcEU1yfG9x/5SxADGQq8uIw7RQVKEm93RcARv4D2uiAxwDsK9RsrFWp0FD9mqKHQG
         L1TEnEt8pahyHmmZIT7w36k1gpPspCfXoK1yYypNcnu++OK7MIMfx0EtgQc2Ydd6UdZg
         61IK528n5z9KksA5uou/Ilv7JiDhUg53txEsuY2bVnCYyZsXJU+LYMTk+YgWNtbSNhov
         XoNA==
X-Forwarded-Encrypted: i=1; AJvYcCVxw/tqOw2XSmJo7i6zcjkENTebRV3ymNBSiqiBQQZ87ko4cjpYYCG1QYyx2uZLQQUs0stlGuazGfqZTkLkSCpW@lists.infradead.org
X-Gm-Message-State: AOJu0YxJMH6EbwNVPcww024n+hXXhnlXA4U5Us8vZxhTO996pLb71xLb
	h98nEGy8LiXzs7437a3HhQ8XgFm0NBcrUHgmcftI3TZgqOr59v3xg0Yt0lEL0RE=
X-Google-Smtp-Source: AGHT+IGY4OdrV2g1gR/OZMrvjE/lAI6jJHYq/NY61VEtXYCuq6a/kfZIDfbwe86CLVK3+WjNbtSP5w==
X-Received: by 2002:a05:651c:1508:b0:2fb:6465:3198 with SMTP id 38308e7fff4ca-2fcbdf60348mr75079871fa.5.1730287550241;
        Wed, 30 Oct 2024 04:25:50 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9207d4sm18412585e9.20.2024.10.30.04.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 04:25:49 -0700 (PDT)
Message-ID: <436b02c6-a262-4015-92e3-454d444e877f@linaro.org>
Date: Wed, 30 Oct 2024 11:25:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] scsi: ufs: exynos: enable write line unique
 transactions on gs101
To: Peter Griffin <peter.griffin@linaro.org>, alim.akhtar@samsung.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 avri.altman@wdc.com, bvanassche@acm.org, krzk@kernel.org
Cc: andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ebiggers@kernel.org
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-9-peter.griffin@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025131442.112862-9-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_042552_222106_355A1751 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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



On 10/25/24 2:14 PM, Peter Griffin wrote:
> Previously just AXIDMA_RWDATA_BURST_LEN[3:0] field was set to 8.

where was this set?

> 
> To enable WLU transaction additionally we need to set Write Line
> Unique enable [31], Write Line Unique Burst Length [30:27] and
> AXIDMA_RWDATA_BURST_LEN[3:0].
> 
> To support WLU transaction, both burth length fields need to be 0x3.
> 

typo, s/burth/burst

