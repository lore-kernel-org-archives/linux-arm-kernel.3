Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65A7C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hI/ECcJmQ5+lRsmCQ33ubWCT5i7ZlE5HoQwEXVHTSj0=; b=FDiE+0XWqXk97v6Ww4chOGQIsv
	Be23FgrzOrJvWKIzvwQdXDmBg1ymmwPosfkGxxQ2xa5oq6SnSshtekTNUd67xQA9opfxym1TGYAoW
	5T5YDyBErkPqR7QYjeTscjTjVMmIvdwLgESZuBlP7lhgZpyDDpQT0YqWUDKR+/7/ovncozU4I1Mwo
	DXROMSRKc8ckl5zqBGk/9b4yH30KKGYOl69EfTXeRcmtHuE1GJscWZ6SmPaYmd8/kRLe37G16GbJE
	soR9svmaxdt9fGni3i+SeaTTFsflWzfA5uGsz1pXfgKkp3ZD2HaVJaiq4qhPy5dJdc1980JHjpczV
	PQ1Lf8pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thshn-00000004PCk-0n85;
	Tue, 11 Feb 2025 16:01:47 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsgE-00000004Olu-2Hla
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 16:00:12 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aaecf50578eso1133952066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 08:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1739289608; x=1739894408; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hI/ECcJmQ5+lRsmCQ33ubWCT5i7ZlE5HoQwEXVHTSj0=;
        b=ybfaNS7bvGLf/aCqoDlgNoqGt8N0xJfdWM2JOr9MOSJKT6z+gFc+UeiDnXq9C5EBr4
         CHlYEz0ldNpLk8mq9cpN2LIdMB9K9D+6vq4Me3kqX6K8aES6kC1zG7LTyp2vWYgYONi5
         t+2OgYhUtyA851RWE3F5JXUpHpYnFfoNDUTJFJ5+BFy0gp8i2sQ8/13onflgS7ud1XhB
         mjfSctRr+gD+nO91GxqNEvMPDzt8YhpFAYgv7hyfJxYK4WJUjF1fp+iMb62aVqFAWMpg
         WVJYjsIkcKaO7uSCpdwTzGXbVDvufxVJfjIwi3ubb7XXAUfixnnQseQ2Gduw9WmuxIvd
         cacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289608; x=1739894408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hI/ECcJmQ5+lRsmCQ33ubWCT5i7ZlE5HoQwEXVHTSj0=;
        b=YpuIrHRHIxEJl6pJIfbcPZhN5S0/tBhNjjvm4KT7D1BlWf40F4QxPQrrcuJdcxO2tL
         T9a68JtLaQl5BOmeMs4xzFYSCRVTVlqW42eGr08Heb6wpmZ03ZfN1Z5kz6/hr5U2KE+b
         GUCiDlE6UzHNMe/uWuYzZxjDp+D2olZbVaJBbnLST4OvKX1WiUT5KmcBzv+sTy6oAEvp
         7mm73sOLvajtAfZ2OIy1ceDjRzwSSRme5dv3INRF8DcpnIsPju41B4H9xJn8zqFW+o39
         9HlW0+VshaYRwfVOp8ssVzTakoU8U3qEfHohNPFPp+UV2XE5hNBmSU0a+f5OaZjmJ9nT
         QT1A==
X-Forwarded-Encrypted: i=1; AJvYcCWNNtiPAjL5yKMUkMgS6EcmYCggJGj3JzFIXHJHIzUCyN+/wNiEMwXO9MlB76ZOqYYPMySazGKAr3Cnoong5i5I@lists.infradead.org
X-Gm-Message-State: AOJu0YwO/qrmZSVoX3sj6boRp6uqheGCxQUukfbBkkPH985bCfiGaI7Z
	ub7J7Zw8vQz/wacRKSnnaouX3M9svCb6Q6yKK9F8IIf3JVGrs2Qfv8q5wV5aD9g=
X-Gm-Gg: ASbGncsk3F1sC5lxqXSnjd55jjTshR47Uf8fX1SvKqMGQJspPxZGbva/NjNos/Y2ouY
	Ih+LDXgogwKyZYFnga/GGCVJaHtdA1TPt+EGLBSvEkVARCadZ4PzYNUou2FJ/7gpKHbbEcDsAga
	nvlq80YaYfWQeXd1U7HlOZNZ4sj4BfWpN2hhPwjvFLPS6hsFWQcm79EB8PNWxR+eVLi8X41TxK0
	jt+68Rqq0LsQBM9FwC7c3pGn5Yb7/zONLpkR1xWZD7lXCjB3ShgeRJGG7gXo2qWwZxjkgEBMVo4
	k7s3TknbaTYTJ7AOcSJ988YmRdhyM1tsD1aUOjxY1tzy5EE=
X-Google-Smtp-Source: AGHT+IE7ksSku6fs3EFiOJ7qMjT+Xj86y9WzUfaIKnMbJB/roCniH1bXiqumQdCG0sjm3B/UGhh56Q==
X-Received: by 2002:a17:907:2d24:b0:ab2:ea29:b6 with SMTP id a640c23a62f3a-ab7f01cc9bemr17039766b.35.1739289608146;
        Tue, 11 Feb 2025 08:00:08 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ce2e91e9sm307325466b.117.2025.02.11.08.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 08:00:07 -0800 (PST)
Message-ID: <91d709aa-2414-4fb4-b3e1-94e0e330d33c@blackwall.org>
Date: Tue, 11 Feb 2025 18:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 05/14] bridge: Add filling forward path from
 port to port
To: Vladimir Oltean <olteanv@gmail.com>, Eric Woudstra <ericwouds@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Pablo Neira Ayuso
 <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>,
 Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
 Roopa Prabhu <roopa@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Joe Damato <jdamato@fastly.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, bridge@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250209111034.241571-1-ericwouds@gmail.com>
 <20250209111034.241571-6-ericwouds@gmail.com>
 <20250211132832.aiy6ocvqppoqkd65@skbuf>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250211132832.aiy6ocvqppoqkd65@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_080010_780687_A50CA533 
X-CRM114-Status: GOOD (  13.15  )
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

On 2/11/25 15:28, Vladimir Oltean wrote:
> On Sun, Feb 09, 2025 at 12:10:25PM +0100, Eric Woudstra wrote:
>> @@ -1453,7 +1454,10 @@ void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
>>  	if (!br_opt_get(br, BROPT_VLAN_ENABLED))
>>  		return;
>>  
>> -	vg = br_vlan_group(br);
>> +	if (p)
>> +		vg = nbp_vlan_group(p);
>> +	else
>> +		vg = br_vlan_group(br);
>>  
>>  	if (idx >= 0 &&
>>  	    ctx->vlan[idx].proto == br->vlan_proto) {
> 
> I think the original usage of br_vlan_group() here was incorrect, and so
> is the new usage of nbp_vlan_group(). They should be br_vlan_group_rcu()
> and nbp_vlan_group_rcu().
> 

Oops, right. Nice catch!


