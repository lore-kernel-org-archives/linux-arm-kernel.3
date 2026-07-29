Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B14C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2970P6vAPUvkgw9uaF9sNtIWHtiv+z5sxig+NiQqow=; b=mYa3sIDM89D2KY0cMp6Qt52xny
	gvrmye1fXpP452CEsIr2ftMmiqB7PI9HODKdfjtPNJF2BbeuQfkwlZiC7MqIDpP2oi/rb0Fn2IH0X
	kVL4Nj+6IBHIvY9CHh8omfibhAND6+976KUI7mDSsjB/uuj/JGcdtVBaYG3a3kmLQOQX05pUogHcM
	l92VsQTj01xj4ZLXJ8brlf7OTDJF+Z6VhoTWuoLNhIk4TS58CkPUkdLlEUE5/75VFPHjahrWg0KwV
	gVB48WWT7szHVOZ5fUfYBjxeXCBXj2x/n9kP75jgnET0xPVyjz75N7HtWtKhQTfga6DMiLPrTpdF1
	ZmgHJ3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5eu-00000008Ico-27cm;
	Wed, 29 Jul 2026 14:53:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5er-00000008Ibo-3IEU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 14:53:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TEZOOt2043558
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 14:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n2970P6vAPUvkgw9uaF9sNtIWHtiv+z5sxig+NiQqow=; b=odno/PMu2poUiAnE
	0hF8u+n2WEvwswMQVqbTp7Z/D6Zq6vC43AIKSFz6bIXOz8BWPUKDto9rRmDYO+b3
	3ffoOnAa5K6RWitXRk/xGr+8IUlNPCYQAkUha+XADy45CNrvZnqLIZ3/VIJBEzMJ
	0FLrDMHMGbagTIv0j/q9rF0I2LM+EHjKHN2Emru5FpSIjqVgrf8B8Cir3dUVVLmT
	bV4IWbIunqvZDcpeHTFNG7H1NbXvUo327bPSQcPLgHlhbnQRN+rR6ruK7sXqjo+m
	Bq7gYsv/pnP8gEYdIon8EhO0kXP2gQsLp9Qv36R2ahQFy1Fj15misxFRwqQiLmre
	p+Em0Q==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqkds8364-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 14:53:20 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81b0c72826eso35025037b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785336800; x=1785941600; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2970P6vAPUvkgw9uaF9sNtIWHtiv+z5sxig+NiQqow=;
        b=EZM0YdpFb+RihJsZHa/0oERwRrGgj4waCI7wg21WBhdNQ0W61tONTJrnSguGMFWR4N
         5D1LzXsOPR3wa+BqjzNTlgGiYQnlnpQavFDUbcewOs1qqI7bBVhhXnHjCLPgyDb2R11n
         20yIIPcodAabfcJ+EnVYTpjOT7Sgt3ohG7UjeSPkQPPr5Sn2DeePJKHiio/gAt/G5gtD
         TsCLp44L1LeM26Bcm/3QGlQp2N96/qb7Ijzy4ArebyGLfzMBG855nlWkMb1NAU6GfL5H
         3Z62zRSn0aCwBGxVj4hjWq2ebZFTC/vquFxygvA+2Px47Dfe/vI4gbwtMXMCfMNwbhPo
         yFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785336800; x=1785941600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n2970P6vAPUvkgw9uaF9sNtIWHtiv+z5sxig+NiQqow=;
        b=LZqrVGz0ErsVTWZm84PjUg0xmkUp5/DsEY16LDo+fC/M2Z9ZHki1TPiHOUqG28BAu2
         QuZEHAWQSc9ZmGPWSHhuZPv2YqOzG96I2g7iNn686aMGopNu7pjE4TDlkIl64v9GQ4Gr
         0d7K6z3+L70A0fpr46H4FXmlNhLiB/oL8GoMgnTDh1TIJo0KUef6kvXJ3wGASGkTsoOI
         JkoXh2E2ZytvYsT5CFwfEZq4oL8xI7tYe16Rdp4yoC1eK6PD0SGx4978lat7qssuvbTX
         J9+vTbk3wCMDJ50/iiEXdrErjzhlEKliqEbupZcqUbGHYN/65O8UGLnTG9ZbPG8zi68L
         950g==
X-Forwarded-Encrypted: i=1; AHgh+RrYYrQbLOnflsXa+84kTPIsaxcVnV8I5VHmhBkSErDe2j8KcaH/l1qRCinVpuxEBXU0cnFt33rryuG+xI+ScJgu@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwxrelq2sLZixsvtoUrY5rocUdwliFg5UNUbZv8XENx7KVoL8O
	IJko8JZlgdfnjjHgM2oc7mLJuR9XBKbJBWMvbUGYwp2pnnzLSwFhzigkkBUdy/ZuoiwZ2N2MBos
	j4c7g/sZrseTtw+v5jy3Y8rWHJugLVCv7qvXqoyESSS616jYyzz8wPDy+3DLzMUAOmgCXBY7BQY
	Q4Cw==
X-Gm-Gg: AR+sD12SWWOgIbzCOM3o88DoS3Ykmi09l47mYtGveTQ3igg4HD51evl+Z9tgekS55QO
	FvxO3aMtBmK1XLQa3zWYzHjXwA9Gv801FUfffCkPJabcYnTQkmHj1cKt6JfHwIhYJ6f8hLBDGcM
	u+vU98FUl9F2urUX8cerQxlQmGg44X2uFPv/k3nzi5BnhkYJxKY2iLjVmwhJA4qYxCi8cwAL+Y2
	JcryUmdz+yNWm2EEWkYHMyG37q2Xl3TPEDqDcnJcmkYFjI23xp7LPfVLWxEiQQILVrpagBgJdQY
	efHVTlmdG7AnFEqRnDta/yCGkmPpRy1BnoEKqaZZqMe5S3Nh5Vruwtp5m2zVAzytvbzbD5xMjCj
	njUo44RCMxPWbgZVm+D71x3oKrxBR9Ru+qK4DlJs30v8fDQ/1OsY/OGFPtdsjiC2M
X-Received: by 2002:a05:690c:6301:b0:80a:4f5b:c032 with SMTP id 00721157ae682-81f993b207emr40446607b3.49.1785336799426;
        Wed, 29 Jul 2026 07:53:19 -0700 (PDT)
X-Received: by 2002:a05:690c:6301:b0:80a:4f5b:c032 with SMTP id 00721157ae682-81f993b207emr40446347b3.49.1785336798709;
        Wed, 29 Jul 2026 07:53:18 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:bc31:6b08:4ac6:465d? ([2a01:cde0:108:24ed:bc31:6b08:4ac6:465d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fa279b529sm19348047b3.15.2026.07.29.07.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 07:53:18 -0700 (PDT)
Message-ID: <f3da8400-1d2c-4eaf-bd50-ae1fcbab04c5@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:53:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for
 autoloading
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        guomin_chen@sina.com, linux-arm-kernel@lists.infradead.org,
        peng.fan@nxp.com, quic_xinqzhan@quicinc.com
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
 <20250203100154.140877-2-cristian.marussi@arm.com>
 <aibW10NMmzw3QnZ5@mai.linaro.org> <aibzLcZiVwtUHAgV@pluto>
 <20260609-upbeat-bullfrog-of-enrichment-0f44aa@sudeepholla>
 <282af085-1669-4d9d-9c1d-2fc232252be0@oss.qualcomm.com>
 <20260729-optimistic-lemon-myna-a14bbf@sudeepholla>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260729-optimistic-lemon-myna-a14bbf@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyMCBTYWx0ZWRfX6CpO2vboSyzj
 EnNdHclJusYxREQY7O4poCo7vdVpwbt19227z0dLrOJfAAHxGkiqpkMXCTu4EsPYUtOn8T+8t2g
 eOefUIDZdNPsPbnwH3QH+pdXypEAq/I=
X-Proofpoint-ORIG-GUID: 01tf-xmCccutHasXtOP_pQwT_WXe45_h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyMCBTYWx0ZWRfX3PVgVZZmpdqx
 quIRLwOzbj+qXOpnzz+GVUDVsbIvb8GiBAX9//OLwchXXiinaIR/vUlYy6rJrxry9oDZSXZ84R6
 p8ZgFigEWmc22hZ0lknEEp6J30UlEsgsfQN1L3slKDdGvceuoBIahq2rUf/eEPniq6HQiyIMBMf
 Ow2XkvYjrIPT0P+nZdjtRS0550cZUY4WY7fHQT1GEnzX/fsCnn2n4aCTRvP9gIb3yFO+lJEwf7t
 RSMof37zoaD1a4fwj9T01GRZ+gB3n0qZnbm6JqW9vGieNHVympICt2sVVXDEuz//n9MexcseWTu
 vqA7g1mHITg4A6pC3CN+1ozhXkRfD7W0jj17ORiAAbeGNUJ7yXmcEFkUfV0ExQ1Vz5Tjja+7E3G
 PAf+HQ8mA+OHeV00rvtQgozyYrfSNSf/fVQ9KW4YJEKVDGeWimD2xkXEfnTF4gVcBA4h9YOFbFf
 3xkUp20gpQmZ551xKkQ==
X-Authority-Analysis: v=2.4 cv=VJTtWdPX c=1 sm=1 tr=0 ts=6a6a13e0 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=yLWW5E55xat3Fkwo5-YA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: 01tf-xmCccutHasXtOP_pQwT_WXe45_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_075321_853853_8FC54FF8 
X-CRM114-Status: GOOD (  16.65  )
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

On 7/29/26 16:17, Sudeep Holla wrote:
> On Wed, Jul 29, 2026 at 04:11:18PM +0200, Daniel Lezcano wrote:
>>
>> Hi Cristian,
>>
>> On 6/9/26 11:01, Sudeep Holla wrote:
>>> On Mon, Jun 08, 2026 at 05:51:57PM +0100, Cristian Marussi wrote:
>>
>> [ ... ]
>>
>>>> Thoughts ? Plans ?
>>>>
>>>
>>> Just repost as non-rfc after next merge window and we will see if there is
>>> much interest to get it merged for the following one and take it from there.
>>
>> Are you planning to resend the series ? I can test them on my laptop
>>
> 
> I thought [1] from Bjorn was addressing the same issue ?

Yes, indeed. I was not aware of the series.

Thanks for the pointer

