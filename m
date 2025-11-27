Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCF9D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lU4Q69fwFr8kha5ORL2VucV6zKxUebFEBdC5v2fRfrc=; b=n755oXFcUEuIjP413vOM2mXeQK
	M7lr3lXLDt1JhpJC2+YeF8gQ/eld8sa0Z6uG5K5OuTpixa7fQgTLQyy3j8rtr0FItWsFL2oesRQgj
	aVxS2uySe5SbP6gncGnKfcEZQUA59RfsMhGfTYfyGErtRNSmb1uS+XKWqBU7wVXbL7IUOyXNGjHIP
	1n9lN2TxzqzZ7SgzIItw25YautzkYEEAq/1luy+Q4XYboy4GvUh+uc7OCHXpCGZh4rcQ+sMcyJVO5
	jtoGQN9zuH6panYp1FAEuBB+U0gfKYZCkcDU80x4snP+aLJk3/wKNfXiXG2/0ZQqBkhrk7hGviHJK
	+DWCIkLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObOG-0000000GaJx-15OC;
	Thu, 27 Nov 2025 12:46:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObOB-0000000GaIj-2aP3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764247581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lU4Q69fwFr8kha5ORL2VucV6zKxUebFEBdC5v2fRfrc=;
	b=XmkfNXxxxWgFCkYi3Ft9rxZs5XoHmxeCG9lsSGcIKf812C6wMqPDCS/crENrT2yl2BWWv1
	7AcMW9o2xbfbhrZUZjPNl+uEyvUfGYEest+Snby68gIftyw2YTsaBhL+BO4Dw6BjoCsESV
	Zv9qVJyhs2AFvwLe2uXTsz6C1+OeZjU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-Unsuj_2FOieF184DJVVP3Q-1; Thu, 27 Nov 2025 07:46:19 -0500
X-MC-Unique: Unsuj_2FOieF184DJVVP3Q-1
X-Mimecast-MFC-AGG-ID: Unsuj_2FOieF184DJVVP3Q_1764247578
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-42b56125e77so495523f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:46:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764247578; x=1764852378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lU4Q69fwFr8kha5ORL2VucV6zKxUebFEBdC5v2fRfrc=;
        b=u7oTasZASPZcwi/SpHW7gqaBFJLB9CeYZgbgZvvSBEiERvd995lPP1nDMZrCgerS73
         w6fAlf5mFT9lbOWNmoPDDOQf4pX9aLaO/NOEjWJuC6J8N/Soemiseb9vl2IhLl0VkqKK
         TLgC0zzs4wNlu0dOmgNdt9Sgyp+99O+PJ51e+tqAO1p99/nHpJrBHGgJOgqz49A9wW0c
         43oXsOpNeuAShGpsddWxqcfN0it30+UAjer2AYbnyO+gc7S5oBmc76xTSdvshDQMfWn0
         tL6B1R04RsU/FtRSogY1btry0L4CjIwoISHYBjaygCSdS/56Wi/2cc77i6pRzF6Tic0p
         eQDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq8TODyhyVgJ/Y+6J6OTzzZn9T7CpZpEKK1KjcuYtKFLjZryiPXYOnzVP6BraTXffgJi7wK216NYVtY4HpiQD5@lists.infradead.org
X-Gm-Message-State: AOJu0YxBX8I5jSqQi2IG9aNu/3ty9kNrEkg+kYxQqAuRqlfwly9E7ZnE
	/QkfMX3/buLuxk/lc1ecJ22Dl6X1lQ0vWsdwC0BxZju3h1cZgJWWS77AYSNtmEHoO/Uz1zrPQuH
	uU9XUT//Pnmk54Ik+Chxq7ncfVe8ggh+AtiDtzvMJoiAWFpXmfQfBH0RgqoGBrL8mvUXUGKFR0g
	aY
X-Gm-Gg: ASbGncvgIp9Rb1rZ8TLknjgzrUFTPIn8fNCfRR8k1rzp3PnUVkc3NsZZa8mSCtbnEam
	aHS2HesRifcPPHU12I2RS2s6zhSqh1SBaFLQE5GtNJSANO6Q9AVPgI8/vQj01chHGERE3snlbV1
	Gan+mg8Hx57IQXyjLwpxV3LFNOLtCF9NfN7AnM2uahTqulzJDIIQLOW+Q44ihBKdeKNt+aX4GRt
	U/vDKnzPVrHZcmQRocYAS/YrGGXQn/58p2I+ToK6apcz/PiTqrh/q5SouXWYwG0nvR9HoAF2I5d
	D/ceF0HlcQAjsC9MX5pGxIxDMpcpzSt5rdG9QDnBJkPyVMgjl41Qp1aOCIESYN6QpphVBBkbbOB
	8y2kEU+H/ZWSgkA==
X-Received: by 2002:a5d:588c:0:b0:3ee:3dce:f672 with SMTP id ffacd0b85a97d-42e0f1e3428mr10930149f8f.4.1764247578249;
        Thu, 27 Nov 2025 04:46:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxtcXT2mGT29Cj2YqBl/we77yTx8kGjUHM5RCqeOMm5jzSp7i0tYkAfQYuvbu+j+zndDkpzg==
X-Received: by 2002:a5d:588c:0:b0:3ee:3dce:f672 with SMTP id ffacd0b85a97d-42e0f1e3428mr10930122f8f.4.1764247577824;
        Thu, 27 Nov 2025 04:46:17 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6049sm3525667f8f.10.2025.11.27.04.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 04:46:16 -0800 (PST)
Message-ID: <9c88eec2-0985-4e05-8f0b-8ce525ddca94@redhat.com>
Date: Thu, 27 Nov 2025 13:46:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v19 00/15] net: phy: Introduce PHY ports
 representation
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
 Tariq Toukan <tariqt@nvidia.com>
References: <20251122124317.92346-1-maxime.chevallier@bootlin.com>
 <20251126190035.2a4e0558@kernel.org>
 <966bb724-59bd-4f45-a2a6-89a1967a851e@bootlin.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <966bb724-59bd-4f45-a2a6-89a1967a851e@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AWCbsGIt3TsTb_XFdIbqyVSgtkK1XwDmifT2sI4xWKc_1764247578
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_044624_080261_E3F73222 
X-CRM114-Status: GOOD (  16.51  )
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

On 11/27/25 11:10 AM, Maxime Chevallier wrote:
> On 27/11/2025 04:00, Jakub Kicinski wrote:
>> On Sat, 22 Nov 2025 13:42:59 +0100 Maxime Chevallier wrote:
>>> This is v19 of the phy_port work. Patches 2 and 3 lack PHY maintainers reviews.
>>>
>>> This v19 has no changes compared to v18, but patch 2 was rebased on top
>>> of the recent 1.6T linkmodes.
>>>
>>> Thanks for everyone's patience and reviews on that work ! Now, the
>>> usual blurb for the series description.
>>
>> Hopefully we can still make v6.19, but we hooked up Claude Code review
>> to patchwork this week, and it points out some legit issues here :(
>> Some look transient but others are definitely legit, please look thru
>> this:
>>
>> https://netdev-ai.bots.linux.dev/ai-review.html?id=5388d317-98c9-458e-8655-d60f31112574
> 
> Is there a canonical way to reply to these reviews ? Some are good, some
> aren't.

AFAIK there isn't yet a formalized process for that.

> I'll summarize what I've done in the changelog, but it skips any
> potential discussions that could've been triggered by these reviews. I
> guess this is a matter of letting this process stabilize :)

If you have time it would be great if you could send an email to Chris
Mason (clm@meta.com) detailing the bad parts and why are incorrect.

Thanks,

Paolo


