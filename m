Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F0ECE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 10:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Cc:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=or9TE/WXMxaRvO5nkgFjtjb9eAmHp3uod9MKvZ2pF7k=; b=LTRzG4IhVt7Cog
	xHYdZf3gVnJ1X0kjhqXq6HdL6T1RQubqIZaHkNSdUtr7Lp+uoRkjHRygOuMZXDGCtB09qH3GJtZwK
	BXNwwK2V0/bFHwDZB/mxFSF/eHp+5Yf++cu+ifASNLW6mgT5+P+ODE2ApyyGEiPMVON5OVzArTT18
	7ctWL8L8e1jXvho+xB20eZr0bxUPrXqZVF/ow4JpOVdjU3yZzeUo7Yzh0xtuTg9oelUiaxPGyJstI
	gil5/xg307d8GyYdfSZIWg/gyRozwHX8b9Xe5oPN1hLqFWpXvwY8419R4gLGHRFQHdlbiXzzMO8aQ
	aL3aiqITjqvhxE0WsgNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwAf-0000000Fqo8-2Oah;
	Mon, 17 Nov 2025 10:09:17 +0000
Received: from heron.birch.relay.mailchannels.net ([23.83.209.82])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwAc-0000000Fqnj-1kKB;
	Mon, 17 Nov 2025 10:09:16 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B6C5B441F40;
	Mon, 17 Nov 2025 10:09:09 +0000 (UTC)
Received: from fr-int-smtpout23.hostinger.io (100-96-47-41.trex-nlb.outbound.svc.cluster.local [100.96.47.41])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 37E4F441EF0;
	Mon, 17 Nov 2025 10:09:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1763374149;
	b=4Q8Zdl8m8HE1nYIPPGRsZ1MwHeK1diG2jRCY5YonYBmK0at1Z67bh6TROdNV5v0z2a9Mfl
	S10OLD2AyEy/pmK74RJKhRSBTiXuXMqKD7MYrW7fVPuP8VVq5Tz1k09B1D+vL0nVwpujfK
	IeIfNHV95kpfeK+HbAhICB6TFjMyByAOcOOM9wdqBJsoaXyyZ8YNFYM+/85CZz5UnbOt8I
	jGMcJ/WLTbq48hSNV8lJdHaUYlzXaprT83/HCpb9NNJ3ApP/fgRihMhnSJ5thv3qFi5Xjx
	3+aDv3Nld3LpvcGdNY5IVTJOrwD8G0boG92vNB58oWvXge5Zythyp43ObQSxLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1763374149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=or9TE/WXMxaRvO5nkgFjtjb9eAmHp3uod9MKvZ2pF7k=;
	b=UyUI/bArhctByQh6XJn2uMD4nfAzdPMei0JVKFMa80TdQmjMKeDYGVS1f5KRXzgtHi/Kt4
	3A0uEznp7aDRhP3jOfxjjKkv8Cql5WYcrerDn9mIRQvv56KRfZGc1DHCPICL/vD+wRYz8/
	ihRsp3+sZ8iVGXF34WYhwI1vfbarnDgX+sXd5cu36EJno2orNIBvstHoeC+6ywzheRqBsD
	ivBYhVpuJhwrrXL8x3LvtoWUZh2jbVdaA0QYgO6n/Tf6jpMhBUGFfoI51TSkAYhK4UOQpU
	S7uv851VUXM84R+HlTxp2AsDL/DfYj5RUQZyFX++KZSTAcYHH3VOsuS4McaQGg==
ARC-Authentication-Results: i=1;
	rspamd-5664d6b969-wh62h;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Obese-Broad: 180a49535d64369e_1763374149442_2762142324
X-MC-Loop-Signature: 1763374149442:2388696190
X-MC-Ingress-Time: 1763374149442
Received: from fr-int-smtpout23.hostinger.io (fr-int-smtpout23.hostinger.io
 [148.222.54.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.47.41 (trex/7.1.3);
	Mon, 17 Nov 2025 10:09:09 +0000
Received: from [IPV6:2001:861:4450:d360:3526:db55:5924:f497] (unknown [IPv6:2001:861:4450:d360:3526:db55:5924:f497])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d93PF0FD2z1y28;
	Mon, 17 Nov 2025 10:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1763374145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=or9TE/WXMxaRvO5nkgFjtjb9eAmHp3uod9MKvZ2pF7k=;
	b=cUcOo77AzSqf4+AGeihiptlalB/HsPaeRfOhR11grfx04xOMKOmvgdwiN0uVv8EqkaedJI
	qil07kXamJh1Tk1OLBXP9nhWUNKJZ0lNzvmDVl162cn+Vv1FOfD/16LBQWqVTTE9DcLDXS
	4r/JDvBBnAke36rlt0VKLMMyMiijbT81Iw6gjVTmgk5LqPBK/9U2om9x3oYzE+xCVWHj/9
	czHEmJOS3Vdiu1KKUpkjmxwaXLMOSr5k9ConQ8jCgnx8rxFdwDoDXMv6jS4plaUALLhKcH
	juGwEEEWIfKznk7WllE9qjeHWIHFghrqpjKRjd6niUNyaydFAxu2Yp/mlcEkGA==
Message-ID: <ae5c3bab-69fa-42c0-8beb-e5fdf0c95251@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Asus Tinker Board
 3 and 3S
To: Dragan Simic <dsimic@manjaro.org>
References: <e4cd11d0-463c-e707-5110-6b92899b1ba3@manjaro.org>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <e4cd11d0-463c-e707-5110-6b92899b1ba3@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 17 Nov 2025 10:09:04 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=GbNFnhXL c=1 sm=1 tr=0 ts=691af441 a=D95WIxbnx4x5pebWhq/9KQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=-Yt9tNsTAAAA:8 a=d70CFdQeAAAA:8 a=jC1VOAsHbhRqxSFWG6sA:9 a=QEXdDO2ut3YA:10 a=qPQde0g9OtMA:10 a=HTceBwxjnJgA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfGekBSnjOTcA9Vl9+rkSdQxhMfGCp4xR49C4DujOnhVa0EAN5xIj9Ao5FNEPnLrxMzfOJ4tkZuHRGqjcU74Xi4inVWYGKuH9kxoxFHyNq77v4xhNSae9 R5VEU7TXS0enfZr+2xluPL2/q7VfFD9fIszRR39oNpZXkeZDVDeCH8Ai6LM1giO+F8vSQ2w37/AaAOZ8jC6D2vVAUVSothQwaSSb3XUuCokuuevLayg3Md7a KvOSOqrdDDGXwVjN+lHuFflsqD6m2VQS1Flj/xxSjmexzFDBxdlvKp/2EgYzxIVEKlbQJ/Y/VoO4B6xC1ex5mP/lki5T1c93KHCUp4P7HhWj5MGrWtn5rUMH iH1FSnkI1jYYnmb6hCjAATN7b4cypcorKmDMPzETTIHkn/NPQI56sPLekVDClQd1l42lsx47El5wYmFYhTn8sNqfPSAqwzcG6SLt6zdzycQ27s+osBRoizG2 /gPr04yDlU1GszD+omCgbMLgXs0kiSvWsxEQGRLlpYfmjAn04wantR0FmoHFpdRto/E+fsva5+cnTEWIA+Duhk9kB6byntYIF/bkY7I3W81AVCSbPgRP+1Ji 7uk+cH2ABJjBSts0xfeSLyssH9MN1SX5uGUmpwQ6WDl6rUx/LijKYG9JQYMhxDZTqxg=
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_020914_680093_2820C3CD 
X-CRM114-Status: GOOD (  16.27  )
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

Hi Dragan

Oops, indeed I overlooked this message!

On 11/15/25 01:52, Dragan Simic wrote:
> Hello Michael,
>
> Thanks for the v2!  Please, see some remarks below.
>
> On Friday, November 14, 2025 16:46 CET, michael.opdenacker@rootcommit.com wrote:
>> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> I'm sorry for not mentioning it in my earlier responses, but this
> line is redundant, because it duplicates the From value found in
> the actual email message.
>
>> Document the compatible strings for Asus Tinker Board 3 [1] and 3S [2],
>> which are SBCs based on the Rockchip 3566 SoC.
>>
>> The "3S" version ("S" for "storage") just adds a 16 GB eMMC
>> and a "mask ROM" DIP switch to the "3" version.
>>
>> [1] https://tinker-board.asus.com/series/tinker-board-3.html
>> [2] https://tinker-board.asus.com/series/tinker-board-3s.html
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>> ---
>>   Documentation/devicetree/bindings/arm/rockchip.yaml | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
>> index 6aceaa8acbb2..cd249325a4d9 100644
>> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
>> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
>> @@ -86,6 +86,17 @@ properties:
>>             - const: asus,rk3288-tinker-s
>>             - const: rockchip,rk3288
>>   
>> +      - description: Asus Tinker Board 3
>> +        items:
>> +          - const: asus,rk3566-tinker-board-3
>> +          - const: rockchip,rk3566
>> +
>> +      - description: Asus Tinker Board 3S
>> +        items:
>> +          - const: asus,rk3566-tinker-board-3s
>> +          - const: asus,rk3566-tinker-board-3
>> +          - const: rockchip,rk3566
>> +
>>         - description: Beelink A1
>>           items:
>>             - const: azw,beelink-a1
> I'm sorry again for not mentioning it in my earlier responses,
> but shouldn't this addition be specified like below:
>
>       - description: Asus Tinker Board 3/3S
>         items:
>           - enum:
> 	   - asus,rk3566-tinker-board-3
>             - asus,rk3566-tinker-board-3s
>           - const: rockchip,rk3566
>
> ... because the introduced .dts files define the actual board DTs,
> by descending from the common .dtsi file, while they're compatible
> in the sense of the 3S board variant extending the 3 variant.

Indeed, that's the way it should be, looking at the rest of the 
rockchip.yaml file.

I was too hypnotized by the section for the original Tinkerboard, which 
doesn't follow this either (I'll send a separate patch).
Thanks a lot!
Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


