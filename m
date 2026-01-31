Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33E7D61037
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 15:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVER5vPZC6mrgsjqcbK85uhUXRqOLGCzOU5rUyInYAc=; b=w0AJEKiEw64m+BGn1LyT1QVKGy
	qCAA8Djjjlq+pVCC+Q04wy4V6hMBDLSEtBzZLWtTP/wwBjb1mIbMUMJqahesDpZx7eOfArudFS/eG
	22XrVxCXDJG/EqlArfhgr1BGWfSjIA2fydrG9q3UtVNNDhRiWgihi4Pj8hmgTqE7FQQiNyusctVFY
	0lIreDjU6n6zBve4nzsHplcmolXP2JGdGSOPriPdsHNqzCy6NzG45zl+jDgS94SPboULh8emR5E2k
	e9uHVGLWcAtpAhvZTwaqt1VTRCtkatLzoLCOaov7zm01EeD+PqafIE4X/bLdLXOEOdzWLvT7jki1T
	Ji5CUD7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDND-00000002mL7-0map;
	Sat, 31 Jan 2026 15:58:59 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDNB-00000002mKn-0Mv9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 15:58:58 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so2010786f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 07:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769875135; x=1770479935; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FVER5vPZC6mrgsjqcbK85uhUXRqOLGCzOU5rUyInYAc=;
        b=n3J3LqanugoRIHWpCODzG12WzHdwPPXa7YeVeXzenl/G8EO2Q+jy4eOQe+pE1M4UXP
         qxTfTWrldyJKTKNN+el3/ZgaxZcXvuesrP8eme2C/2hLJ36xUusY8CrtsECEKnOEe2qS
         sZDwifJbTfOWuQJ94rpjZA1TaDm4WcgdSk1d2/sGHTha82fGG7PhdXXlqon/TCPhdmqO
         Iet+3nWy7JUCVPK8YKeb6DWq2UoPsYzYz0g42GNLeGWN9e98ZaJQmC8N1wMradeT3Tze
         ncmR4ptgQ1vX3iB2zkiwXmP4mGfl3SrDgRK3okxEM5Ra4TjEjqEi/htGOa/yym9w51tu
         T8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769875135; x=1770479935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVER5vPZC6mrgsjqcbK85uhUXRqOLGCzOU5rUyInYAc=;
        b=A2WWeAz5/0ZSVubKZEUOGa+QBS83yMyWGNTWiXogcW+xkIDc6htkz0w+CI7Ny65dRM
         3Ge96OfFQm9vFFxFY5O4n1+Tp7AvA3drBG7rPpyCtjbR+0LSRtr/M7DTy5SS2K4psyqV
         jUDgWrxwL1PBCtWdfl44KZXsSBiGvUFY4O8O++tErLs7n29y31lVem5PN/EmTy2sn4ym
         5X6tC7huh+Fb47Z6I+rHs1JwG8V4aVvMEohqzRpg3nxbEBHqTKB6r9Owf7R1IqbaR0od
         aytrJfnVrakR4uzNrPCQ6QaZb5e+ZNExKUDFYu05iUe5M3b5Psk6voYtQXtqerYdCWqe
         2YKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3yCe0adyY4GR1EH5Q9e/x7YDX7/L6w44ZfwPSP82VzIO//HOD/CmCsmJ6WzWoGEpNC1jRlQd09haLS/7H2BxO@lists.infradead.org
X-Gm-Message-State: AOJu0YyzXQz3Yc7B7xHM9mTK6d07v38YCNgvx5teUXsSFRqm3S1NX8j8
	krzDc1Wj58C8omXYHf6FeQ3JNnw2zcCU2d3tmrANDdZmWbGzqin0IP00Ak/rQBE/8Ak=
X-Gm-Gg: AZuq6aL+hM7UxMBcsmNbFGvU+7YQaEFbp0n+XCdLhjF6XDwGDHIcnVLu+UFW8sAeW6Y
	4iH+1q0n4PW1SX+gAjX/AGN0t/8A3BZ0HxASdH/9rjAr/mL1WKWcgtINAY2oMBMr0A5CZa2Hlzh
	J7kncF7WzgwoYTEv97rE9tf841xgHxg8yRbpaK0N//JCDVxMvjHFn4CqXp+rVaQ4VUgaz6uF43x
	8mGl/rrgIXZ/9xKVbsRWuZa/3rkmP+//SsR8VRrTPGThHf0GMrw2x7uj/VBgOxEJYuD3gYyvfMO
	SboCgYaYaI15mrG9egsDaGPj+/oO3hJwbKUFjObi2FwLlARqa6p8xRzEuB9dx/a2peUdElnfGGX
	r41BMn2XaSLR6UardEptDBHLJTwoIJ/8OZWeS38A6GzKkMO1f6zNNTcsEPBC53fmlsw2/5y/2jo
	2yRkF8XCAalX1zAN/OvQ==
X-Received: by 2002:a05:6000:24c1:b0:435:8ad8:b7a with SMTP id ffacd0b85a97d-435f3aaf763mr9878839f8f.46.1769875134874;
        Sat, 31 Jan 2026 07:58:54 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1322f40sm29757534f8f.34.2026.01.31.07.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:58:54 -0800 (PST)
Message-ID: <a34bbde5-1dc8-4cad-8deb-f2e7855eb4f8@tuxon.dev>
Date: Sat, 31 Jan 2026 17:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/19] nvmem: microchip-otpc: Avoid reading a
 write-only register
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 stable@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-4-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120154502.1280938-4-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_075857_151164_B2210FF8 
X-CRM114-Status: UNSURE (   7.72  )
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



On 1/20/26 17:44, Alexander Dahl wrote:
> The OTPC Control Register (OTPC_CR) has just write-only members.
> Reading from that register leads to a warning in OTPC Write Protection
> Status Register (OTPC_WPSR) in field Software Error Type (SWETYP) of
> type READ_WO (A write-only register has been read (warning).)
> 
> Just create the register write content from scratch is sufficient here.
> 
> Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")
> Cc:stable@vger.kernel.org
> Signed-off-by: Alexander Dahl<ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

