Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715D2C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 05:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eA2hfEiZiI/7JkZCjO5oD8P9s9LvCtYLtekjekYfD9s=; b=yrl2AZFwXzB1lBMVmNi4N4APMT
	7K97EvIhwKDnyzezQg+mRhCkszqkuB6UEQpZtioBmY7SzorPhY+NlpzYbVyLjynZlMiEa8aY1qiwg
	lJh5vA/x699O4BfuQcMRvQ+NrgbTRGxL2tw6Iryy/Co6hx+j9X6PU02EZlQUnDx498YxMEvRqid1P
	vPFDBBPUFr47s/73fiWPubvepcCRzlk0UvXKXzYN0rML59seUrosJhwEVb9HNyTAnDB8LOYe2VKoj
	3JBfe30nmXv21oVznwRdUqpATV7XitA3h6jjCDKPC9WZUamGRV0kaQm4K8rzf8tjsG9b0HY4G2zUq
	k3bgjkAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYehD-0000000H1zl-2XN1;
	Fri, 17 Jan 2025 05:15:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYefv-0000000H1vT-33oB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 05:13:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436341f575fso17008395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 21:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737090821; x=1737695621; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eA2hfEiZiI/7JkZCjO5oD8P9s9LvCtYLtekjekYfD9s=;
        b=E5C4L8bnfVjikeGRn+0AoSq0DiTc7+T/i+EtCtoCLranWmrHCbiufo0I7DDkFySwdz
         VxTV/RBTZM7LRG+C5fpnHe6I/M4QZgbcGdlPMB0PpLk5F30lwQfzqgE6ClEuhE94yIZr
         BOFtv8+SiTz9Mp46CahoUsmswjZAhX/ExWw3zbOMh4eF8wLdqNx18FV0SL5XvCWe7H0F
         M0VC5xc2dm46I3z9vEI47XHjk7SrihZOQtIKv38q18q3mmLLLY78N397GMAwt1U9czmT
         qeAY/WjxV0C2uRfc/QHN2Dr0o+K4/Qh+te98qaBjji1TltN3l+cFvstk1g+8IVB5RGk/
         GKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737090821; x=1737695621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eA2hfEiZiI/7JkZCjO5oD8P9s9LvCtYLtekjekYfD9s=;
        b=ap0Imd5nhi+aZH+xTut3POPIQ7WAvXtRkpFqIywHTNZMFfWVUNarEEKUzL2665zUiy
         v7fRnQiNbUMmxFInLXykH7iDKubaHEl5VtNP8YFW4DnYBa9QHjYRUsxZLqvUY7biVEXR
         8j1bxGtop5GevChHncNDwe6g0mOvSmSKPj1gTpP+koT3sg4Z6k4GOYEtVhAXPjQSKzts
         d5PiUpbvUeualgFIlt6xlqQ9+uplcZx5E0sC72CDmV4MZMuYLq8Y6hOFhgbWv457B8eT
         ksxMjprPzbo416eqd2Oa3aNhegdQjBZvOhVHNiJOrY8/Qz9+V2rmmhorpdVi7BG62x/V
         FcsQ==
X-Forwarded-Encrypted: i=1; AJvYcCULLkG8kKuFDdjJgMpQYUgTFnxWBlUDkFTPHYZ0q04VcBJHrECPKQhdjV+1Y2iNl2hDXqjKFiCclTFJT0aBg688@lists.infradead.org
X-Gm-Message-State: AOJu0YxzlVqCaxkGyX1EFvuPNRri6v9k5pRUHrZD/hbAUhEcucy7dMbc
	H27SHp85QPAEuBv8bSESFgxyJjeadSpHTM7/Yu+rOJG1Mlyvb9hsLL5xVGjt2LM=
X-Gm-Gg: ASbGnct5yNVHnYFAGvz0dstydBrB/+yc2xXVNVGnwZTUvFsAjKzjzbtX2LCIiv5CThw
	SKBE64re/0wnVhxYPz47thQLL5lNiyf/te+FIKMNyHOQdj+m3mNYX6+xEWAI7LFPFkIrHvaJnHh
	Oh/gkJn1i+1dr6LcV9DjYt0HHD4UsdOTMyUEDORarcmHm8EOwjSnrpL9YsQ8hy+k+llHCfzJr/M
	C+3VzAZlHrRteaQUtYuj91xfuhHaidaqQ8O/QGvWxsZrVNGgIFpy4Jy+K+sZA==
X-Google-Smtp-Source: AGHT+IGGVebus2uYIGuuLFBd4qUm10d1iM3tfiYX430p/eyvedP+1HKhhDpD5iwKxIXhksPpV3KmRw==
X-Received: by 2002:a5d:588a:0:b0:38a:88f8:aadd with SMTP id ffacd0b85a97d-38bf57bea5emr694186f8f.53.1737090821304;
        Thu, 16 Jan 2025 21:13:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c4751sm79637735e9.19.2025.01.16.21.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 21:13:40 -0800 (PST)
Date: Fri, 17 Jan 2025 08:13:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH] pmdomain: arm: scmi_pm_domain: Initialize
 state as off
Message-ID: <345b6d8f-e5bb-4443-b385-a6b87630933d@stanley.mountain>
References: <Z4TreQ5bA9qiMTgC@bogus>
 <PAXPR04MB8459F33BCC84CCA8F49F3B60881F2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z4UZ2Au7KSFMibDW@bogus>
 <PA4PR04MB94855052830C8F4874237BA6921F2@PA4PR04MB9485.eurprd04.prod.outlook.com>
 <Z4VLZgAWR7ugDl7W@bogus>
 <PA4PR04MB9485E9C126E48A088D7E399B921F2@PA4PR04MB9485.eurprd04.prod.outlook.com>
 <Z4aBkezSWOPCXcUh@bogus>
 <PA4PR04MB9485507CCC21354B5ED55C3792182@PA4PR04MB9485.eurprd04.prod.outlook.com>
 <Z4d8nrJy-h9EwzsJ@pluto>
 <PA4PR04MB9485CC9D9925BB5D23EA629092192@PA4PR04MB9485.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA4PR04MB9485CC9D9925BB5D23EA629092192@PA4PR04MB9485.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_211343_776059_31988076 
X-CRM114-Status: UNSURE (   7.98  )
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

Hi Ranjani,

Your email is pretty hard to read when we're looking at the email
archive or on email clients like mutt also.
https://lore.kernel.org/all/PA4PR04MB9485CC9D9925BB5D23EA629092192@PA4PR04MB9485.eurprd04.prod.outlook.com/

regards,
dan carpenter


