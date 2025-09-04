Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA1FCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sCKhfcgyHLiVbYIn51AYNR068gwdjjMoPj7gk9BYRE=; b=qSQMK8PxGTZASHVR8A/SqrcXaH
	2mDK4znwUdzqDV9Fgv2Vuvzg/1iattjgJT82BEHVQXkPrtWhwdVdiYw5f0pKbUBFZ63oWUmJQ0CWX
	x6H4RTKPiL2QBRS1D0PMpZV+qB3BuPAz9VCovsqh8cvTO5gPCYdL81x62XZAU1iqNfzZdB8q63JVk
	8nT5TkckdOCeRiu/1WXA00e7aBlU8Uihlepg47gezR58VIbOHA3+J36LWOKDl0mogq9+dhSa7q6ux
	XllMlWNtSOGGLlFxoDzF6rmpBF5c2dfXtRxPhi1BiCHvHMVblU/CkTS2IsAWJdFULmsxXdJ4AM3ti
	5jLcPEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM3H-0000000G1zb-2lKW;
	Fri, 05 Sep 2025 02:19:47 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuH6u-0000000ES1y-0Xvq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 21:03:13 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cHsQ45BFRz9tc9;
	Thu,  4 Sep 2025 23:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757019788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sCKhfcgyHLiVbYIn51AYNR068gwdjjMoPj7gk9BYRE=;
	b=quwR8jsfvnQjtTD8/HQnSbnUWpj2NWzwl0bMcKZ9nc2R/k90VqFtrDIpX8dzwReyHc8BeW
	4EY6ifikPS3E5m6hsKrasLc79GqPCK0GDt5LvujQXWswUqRGK6vRVOxMYI2IeGZlBWjhoz
	eW6Q8UTRjj0SnpeH3H0uBdrUe8SD1OJBb1BrUO6YJiEa9RzVp7tKsftK5Oqg0PwufrzE8S
	BAJBI9iIB4ozswCOaLkkoAnuTqxV19affKZkDoU+24qteN2tGSYIurVujEdpGLGrlBC02A
	a3n/2V98s105qSZ4o0/1FWmssC01D0ct1nKokECMzkd9nQWc2o7TS/TEG2jYpA==
Message-ID: <fe5e8f92-6f53-4bd1-80d6-f27d93f1825c@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757019786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sCKhfcgyHLiVbYIn51AYNR068gwdjjMoPj7gk9BYRE=;
	b=cUzuDv8BxsNOqajONwHHhcqnezzwr3+44lOS3V44ZgdPmsngmkkI8CujqcmxgHWaWrf3N9
	/ewV0e22UrRiO8RmFQhRUP7mQTKj/xUDfZ3+cRJ8tx5g07NWNhrMpXdOOu5ynBMO83eYCa
	inWY9QDKjn/TrnqRHIG9Oxmtr1C1zEy2LfyO0VG6/RlyO7JSlFPCG7S9F2TFEj36X/0Rhs
	G1ptaN4WObcp9rMgi2Qecrg5eqJ4UwgzBNXcsA824TIoSMfQbNemN1TjVXz54ttlRw7urh
	lj5fVMm5rU2OBDz3YNdFIpBLNPXhPas8SOzR3u2OQnbMBLP2be03KNQb5V10XA==
Date: Thu, 4 Sep 2025 23:03:03 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] dt-bindings: display: bridge: renesas, dsi-csi2-tx:
 Allow panel@ subnode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
 <20250904200431.168363-4-marek.vasut+renesas@mailbox.org>
 <lecx2cs5durkwq4at4w32bgak3s7tsxfmj6fzvyxhfjud4zljm@25aijm4rlhmg>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <lecx2cs5durkwq4at4w32bgak3s7tsxfmj6fzvyxhfjud4zljm@25aijm4rlhmg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 80edf943af1d9f462a7
X-MBO-RS-META: 17ofh69nbdfj47cie4s645me1csma1jj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_140312_326576_94BDF65E 
X-CRM114-Status: UNSURE (   8.62  )
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

On 9/4/25 10:23 PM, Dmitry Baryshkov wrote:

[...]

>> @@ -80,14 +83,14 @@ required:
>>     - resets
>>     - ports
>>   
>> -additionalProperties: false
>> +unevaluatedProperties: false
>>   
>>   examples:
>>     - |
>>       #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
>>       #include <dt-bindings/power/r8a779a0-sysc.h>
>>   
>> -    dsi0: dsi-encoder@fed80000 {
>> +    dsi0: dsi@fed80000 {
> 
> As you are touching this, you can drop the label too.
> 
>>           compatible = "renesas,r8a779a0-dsi-csi2-tx";
>>           reg = <0xfed80000 0x10000>;
>>           power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
>> @@ -117,4 +120,50 @@ examples:
>>               };
>>           };
>>       };
>> +
>> +  - |
>> +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
>> +    #include <dt-bindings/power/r8a779g0-sysc.h>
>> +
>> +    dsi1: dsi@fed80000 {
> 
> No need for the label (dsi1:)
Both fixed in V2, thanks.

