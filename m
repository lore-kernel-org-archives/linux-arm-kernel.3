Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C753AC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIIV8i2tvb8tBK+tEU2BRevQmqyOqUAI4Z6TbcBV6q0=; b=02oboO9lsQv8cJPLtFT83cUwYv
	9AxSsGqlAvRx+kTgvnPtgOPMgKmJaJ9qAOIFqGQy99iKXR2hAJeA15hZ2+2DX1BkCJ27bdZBbVic+
	9ZqXz465je8NstIymaBVlkbBsHW2C1D/kA50hEyBOmTuqXAXf31FxK4hd66K2sLGBNAI7C1OaFzcC
	irAXTNDOGedwSLVdi+QN9ga6PuLrC5adBUwTVr2gSeuKvB7CUXUR6yFihprR74yjgAr+U36EHCciH
	c2XORMDvqoHb2py7auPzxMGKCqxVYM3sQFnq7b8ZSVRzk9roSAnRUDsxBmmROKhkXLrjCEneKFzNY
	pKy71C7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thta3-00000004bFs-3I9V;
	Tue, 11 Feb 2025 16:57:51 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thtEc-00000004Xbq-26Ke;
	Tue, 11 Feb 2025 16:35:43 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so848874766b.3;
        Tue, 11 Feb 2025 08:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739291741; x=1739896541; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mIIV8i2tvb8tBK+tEU2BRevQmqyOqUAI4Z6TbcBV6q0=;
        b=ADqVWB8YEvJo8Rhb1ZFcgePdgyyfs+aMGT1rzZeBQ0ynhpNoe1pVkNyCW3l05nTg57
         e/eE+p4DjyF4hMbZWUGpPt3upWylcGZ9GmEZymDCIoc2V3JrSBkIfjdJbZ3Un0VFSAxe
         8lD0UUS7lButb/kBHz3Cc/PPgxnWymeEmAOMoIzMjQz8kGpW84fcpKdCYfeiUj/p91B8
         bo3umTHwqIw4PEnvrhp8uPb0Ja6lwZkzKK+7P3WO2DOvcE1MUAa1b+qwOwTjKb8/+RSr
         MnIn9bjyqs+t5BIzImvEtJLxq9YEn5DWHaX45EtnPTPAxmIBAtvAe5buuOawqRe0lOK/
         v/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739291741; x=1739896541;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mIIV8i2tvb8tBK+tEU2BRevQmqyOqUAI4Z6TbcBV6q0=;
        b=WO61CIvPA1S7LXD2K6EOnlpbEWGmpUdtHlJ/Oda63t6A6ZyQ0Tk4IyZR59ll7sYrff
         IERYVUJ0PbZJZ7aoO1gsL/dDNcVbqn8MsOJqNqmIe+2ZhXa2wz8jshIYZMYGa4SuoHZY
         QWZ2fpHcZFHd+n2MJ2pEIElmFEIf8qxgYImObOUKTjnfLPKUpcf2UlhNONbKwS1B6p5b
         ikw4PBpxPokgT9gNoXSMvHpr/D3p4CqzpEfiFih2KnaAC2mfy0+tfNUb4h9k0WWe9ywd
         Jp9Q0PJnVPqpcxa8OnHv9CPkMQjw/9b+FB6NTqZOIVppMyGevt1gYGXUkHPHGD17j3Lu
         ROhw==
X-Forwarded-Encrypted: i=1; AJvYcCVt8pbx4jLNSEJ76EflZ5RokZ5zTIUucg9wV9PM1Z/lw+KhamvCAnNgz7tfWv/wlNQI/GvKj17GAvz+oPQ5vuo=@lists.infradead.org, AJvYcCWgA6PRnd1Y2zim+j1cUs5Zce4UsSAfv2zQGtjV30p0dnj6Y/F1llXUN8Y+naUBod9G98Xk+/3Z/MxD4A9xQc6H@lists.infradead.org
X-Gm-Message-State: AOJu0YyFUQ6T1SUqaNxBWuGBZQEJV268s0IadhRyvtN9Dzt+fIldeS9X
	lbUCPc3b9U8USlk1VOEY3h3uZCKPOyxJUmspOHchBinvk4CtoYn5
X-Gm-Gg: ASbGnctCBLcTQteZbSg7XuKphBLY7CMdvtGk20K4W+/YTuVuzFX3Se4x5DuOXsNniMk
	6YIjTULjeT7B5z59EvETtekbRZukWrFwgDlF7W1ZvVUNGx4IR749MT6mQjJcQx31a2RsIzNqepA
	rgvWLZQSPHHJMybROIItTCzPzmxNm/BzGjDRA0aCnUf7alDt4q+YhItNRFREcLyw1HYNRpTxhO1
	aVgmyJiKwIsV1qw8+ysOTT8JtBLnQ4ErDARHMaL3ylgxgDXSME6qdCA0cJCLmhiWK/L3MwWtgUG
	4oU7h6y7QIyGaBAyKjKoxjSRWW09pxT4Yn5GX/erf1Hh/k/v271ndgmlwAGbZN5kk+ucMG3I9Gm
	9z53K7KWrgC9fWjbIwGSNsG7zuV0Bc2rK1k2njYnk+lWG9OVlPaWrIX07V5FJX0SQpg==
X-Google-Smtp-Source: AGHT+IEaE5wrrlIY6nl8fC2Lf84LvPSm2KRFTGEbR5fKUB08K5dstyn+LuQpM8Wzz6vHlCpVh97tIA==
X-Received: by 2002:a17:907:72c5:b0:ab7:c284:7245 with SMTP id a640c23a62f3a-ab7c284dcb7mr766174866b.18.1739291740484;
        Tue, 11 Feb 2025 08:35:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bf9ae406sm445655466b.82.2025.02.11.08.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 08:35:40 -0800 (PST)
Message-ID: <1aa60578-ba4c-458b-b020-cff59b119bdc@gmail.com>
Date: Tue, 11 Feb 2025 17:35:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 05/14] bridge: Add filling forward path from
 port to port
To: Nikolay Aleksandrov <razor@blackwall.org>,
 Vladimir Oltean <olteanv@gmail.com>
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
 <91d709aa-2414-4fb4-b3e1-94e0e330d33c@blackwall.org>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <91d709aa-2414-4fb4-b3e1-94e0e330d33c@blackwall.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_083542_541900_11724D6F 
X-CRM114-Status: GOOD (  11.78  )
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



On 2/11/25 5:00 PM, Nikolay Aleksandrov wrote:
> On 2/11/25 15:28, Vladimir Oltean wrote:
>> On Sun, Feb 09, 2025 at 12:10:25PM +0100, Eric Woudstra wrote:
>>> @@ -1453,7 +1454,10 @@ void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
>>>  	if (!br_opt_get(br, BROPT_VLAN_ENABLED))
>>>  		return;
>>>  
>>> -	vg = br_vlan_group(br);
>>> +	if (p)
>>> +		vg = nbp_vlan_group(p);
>>> +	else
>>> +		vg = br_vlan_group(br);
>>>  
>>>  	if (idx >= 0 &&
>>>  	    ctx->vlan[idx].proto == br->vlan_proto) {
>>
>> I think the original usage of br_vlan_group() here was incorrect, and so
>> is the new usage of nbp_vlan_group(). They should be br_vlan_group_rcu()
>> and nbp_vlan_group_rcu().
>>
> 
> Oops, right. Nice catch!
> 

Hi Nikolay,

I gather that I can include your Acked-by also in the corrected patch.


