Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887CFC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 20:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2GkHx4QTVyi0OT0e9WCdAsHm7vIJF8oUFztxZt5AGc=; b=hQy00OuLd8Q18fwlX1NbfUVXcM
	ZCcDKJ9mScT+VJi9o56IxxCUKGJrUgX/qx07e7797D2BOEL2w1l2s3UGRsrERfOgNeUBU8I4grJDK
	UUTE5vjWuNPrDYlgI3g653LYezeXOvTmdrSRFeSaezjuzTIh+7ExzDoFvo/Twk8WvKk5lu4bbiTo2
	3r1ZazhGmeOCOYuslAEGJkHd1YnY52WGsCj6+kmgU/jK1Ej2yaCWvKsXYV4dGYvIRc6sGDU7tuTTd
	RmqYNZcAk824DzB1Zhsq/iK7wVU3AZG6nMTwz3zWTFLia3UTfkYjKRS44dMS+CL3XB8m28G2oTFo0
	J4JizW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQfn-00000006VJv-1BDR;
	Mon, 13 Jan 2025 20:04:31 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQRU-00000006S5B-0DW8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 19:49:45 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DE6RQH019827;
	Mon, 13 Jan 2025 19:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=d2GkHx
	4QTVyi0OT0e9WCdAsHm7vIJF8oUFztxZt5AGc=; b=QZAkYxeRygGqeVN9c7G6aC
	VQfBeFQJv+KDaQO5Evqaqn6I0e2OBBZ93ZR7D9tJGrT4eBkfZEus43CciAZxY+K+
	c8jTAB3BWVWfWITreEC5esAhLAAQF/ecC0k04NM4/ORRrIaArzY+KodddlSRwZ4l
	Wde9jcgksdLOfF7k+WATvcpalpCmm8fkq5z2i0o0UV8pesTWgQN2Bq66/URHNOHi
	1cmPbw58l9VA0yL1L0lqZhQykPRy8BSq6PeScZJy3qVC3WQcb2l+0A8moGCi5Oxv
	48awYrCyJZPIaLhDdTkocp5Hs0sGCebzn8cQY+/uk2hxNuUUvYLkZT+v5Qau1Vhw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4454a59hmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 19:49:14 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50DJnDAw017868;
	Mon, 13 Jan 2025 19:49:13 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4454a59hms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 19:49:13 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50DGd9gK016994;
	Mon, 13 Jan 2025 19:49:12 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4444fjyrny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 19:49:12 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50DJnBIO29622810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 19:49:12 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 165625805A;
	Mon, 13 Jan 2025 19:49:12 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6136458051;
	Mon, 13 Jan 2025 19:49:09 +0000 (GMT)
Received: from [9.61.105.40] (unknown [9.61.105.40])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 19:49:09 +0000 (GMT)
Message-ID: <99645919-6756-4442-ad2f-a9b353da22c8@linux.ibm.com>
Date: Mon, 13 Jan 2025 13:49:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] dt-bindings: net: faraday,ftgmac100: Add phys
 mode
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
        joel@jms.id.au, conor+dt@kernel.org, devicetree@vger.kernel.org,
        andrew@codeconstruct.com.au, kuba@kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        andrew+netdev@lunn.ch, eajames@linux.ibm.com, minyard@acm.org,
        krzk+dt@kernel.org, davem@davemloft.net, pabeni@redhat.com,
        linux-kernel@vger.kernel.org, edumazet@google.com,
        ratbert@faraday-tech.com
References: <20250108163640.1374680-1-ninad@linux.ibm.com>
 <20250108163640.1374680-2-ninad@linux.ibm.com>
 <173652497637.2952052.6627595246829829775.robh@kernel.org>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <173652497637.2952052.6627595246829829775.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e2UR_H-XhwWAH3iBg0WOCRUvriLik3My
X-Proofpoint-ORIG-GUID: W526mhYllqjPLt3wkW7aqjCd7n_jLJWp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_114944_231904_43E8842F 
X-CRM114-Status: GOOD (  11.55  )
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

Hi Rob,

On 1/10/25 10:02, Rob Herring (Arm) wrote:
> On Wed, 08 Jan 2025 10:36:29 -0600, Ninad Palsule wrote:
>> Aspeed device supports rgmii, rgmii-id, rgmii-rxid, rgmii-txid so
>> document them.
>>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>> ---
>>   Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Thanks for the review.

Regards,

Ninad

>
>

