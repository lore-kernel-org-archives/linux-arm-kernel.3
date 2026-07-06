Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E8DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iq2547hWkLyPSn5vKecOMarotbQZRKymJ/MEe/TR2/0=; b=vq3SBRA5I8rghq8zfHt1txfFTs
	BcR1KUrS8EWywuERsGYrZ2q9zLObwpCxWv09kXfRBEqatPYHPPduARh6GUlnuRdmQwkTpdeBsUs5S
	CZeJlWItHb67xcTj3THhNxvg3I99UHqvCL6KG40O7UQ6IalGFBoyjhxftQSJNXfaBJ+MR6qCkD7FV
	Wb//gmNG5tpxS3URy/NfVY4PHTBPkZVcOCGI/t6DxlgIlNHx4EnKxDvzieYNQcVUaDBY7VSVqSqgx
	geU0iVen4CLZzzAdtGjvpSURtDdJc8UbXIhZ7+kjQ12mpTIA15qMwC9ZZRuIWd9RAohqgEsnGe54g
	Tvrl4xbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnbS-0000000DHHm-3sa9;
	Mon, 06 Jul 2026 17:59:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnbQ-0000000DHHI-2Oxi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:59:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF78u833027
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 17:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iq2547hWkLyPSn5vKecOMarotbQZRKymJ/MEe/TR2/0=; b=D9dS6ZtggisbxqVw
	VXNH20ZxC6/PiGXHw90REEh6dwZDMS/8Jps1l/TWXPucoikMfgj6/7kXVq/NKlNl
	vJS6Q0k+mxlZuBPzq9yJYF3aNmV/jEWJTFacqRhoMZWDgMY567uc3dRVdSsfe0X9
	zW2U7ywrsTYVhbudEW1+hSMxaMQ3ynWaUvrj29AwT6OdeXJx39z984puadx2X8LL
	uROqcqcMF2JbosjruZSiUG/4pYiTo3vkztm09jTeaeQsjHUR06VnXyhoEkdXVfkf
	O/eI2ovfqvxDE019fdtnxBb6v8DHB40rJ8lpwmcD3rJbRtBa2qrKvEtsd3K7ycM9
	j9S81Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98j5j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 17:59:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e695a3b28so6879585a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783360770; x=1783965570; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iq2547hWkLyPSn5vKecOMarotbQZRKymJ/MEe/TR2/0=;
        b=WnWI16ihvJYJ7nMV1BlgRHAyuHMwRYa5hIhTcfXnHDIUOQlld3kexrgZXOa2v5I1SA
         /0U8bGIYz9ams+Z9apeK4Ad8VdlHp7AAoV3axzM4ps2UoSHIhnV8pUj3UHAI/cVvtj40
         8ceOgVfGFKlGdq/Xg/qC4DxhD49FdfG9u81YKwbjPTG38dXh5MV6fn+Mu0ZFUZuylmWf
         jqR7nNuMNeC+5RxiYRqVMOJ6rbhGxpMrft3dr7XScvTOO5VfvFLwT3wrbaTjvEeZdS6A
         ewcpdIcmM0/7vIiSFgw33xppuWa2mKzjFeHQ04YHP3CFuNnXQ+rZsn2OSkY91noKfquy
         9VtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360770; x=1783965570;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iq2547hWkLyPSn5vKecOMarotbQZRKymJ/MEe/TR2/0=;
        b=PrBiqAzk+P4v1bD5TFkQePfHwjhZ0it6WxvrFkN6clxTwE7u1jaSBMSpaQOIGhFJx/
         2AMpY064jE4bvqRl4ipQXmLxHq2H7fa7elFuBpiH2b+Fits/Tkg4Y1A9t7QvEQHqIVsa
         Qw/xm22+5/HNQg/afcCV97d/RHScTYBRY4+qVxmOB62vn6G5Zge5h9yi9Dvl1F/btcOp
         qK9kZHWHwM7VzEw/wWnr1az4DTRR/sRbO0d9yI/Sh+ubnnKufuE9EMsFDcMo36EX1pRr
         aHspMwCq8SkGtCxAjnIbS0p0/p8OiORrUydRAPnavyouPT7MPXargraRM5VDgbW6rgFe
         uNug==
X-Forwarded-Encrypted: i=1; AHgh+RreAPqkdwHbKHe0izP7E5Rrw5IvQolIrMn8uQCOTnyt5JrzyjHs5Ui/44oGSL/MpOtjF1OPJUrbfPRhFe3yGyfn@lists.infradead.org
X-Gm-Message-State: AOJu0YydNdiunVdL/9D6TDhrnucALT2Zgt8oov67wozJ2/KbxfCH/kOc
	fKFHeAf/5zpACx/ibIChzsOVjl01FZ6LpwXgoiuxwPsOE2ywBVz0I0fGbwG7NmJpcTqe1OqfBc8
	/BQMMEkoBaUFDo8W9DftnPGcfmq97TPdx0kvgcP5uQWqB0SZT4xW+4r2wKy4SjuZ4+zrJ6fCAL1
	Ylug==
X-Gm-Gg: AfdE7cnzcxebgIt+x/mH7d6UJnh3Ri8OZZDrp/uF3BSB/0QyqWQ/nI1OCIZ8lltdpQu
	AASjXu7nLbZHE8AsXaWWhH8xH0pQ/mUrj0dd5liO91cTGf7MmzV31bNp/+vTO07hc4jjT5e0MgW
	OEd3MmUE9dco8dl5Af+4mkianCK3t0U7tDpsvlf9bkmqu+6aqmlgDbIAqD1hMB36fv10HSOI5jk
	SY3l1eMea4UeqXcHHZNnvlXOwQ8ueVHG5JcSmz1fS4AjFeLX1tM71JtRq+cDR4VwrxpofnZZyQk
	17yvYkkNcqEKhC3DudpUKmxl9SOehEbYqRGzzeQYfES0lR482CHAcGLUxe0CvjrKK2cUBiVwJys
	eGTah4VVA5ntbq3qS+XaLwlin1SSVf4KhPDYPynLP
X-Received: by 2002:a05:620a:3944:b0:929:7356:2e51 with SMTP id af79cd13be357-92e8b29ea49mr2099262285a.11.1783360770241;
        Mon, 06 Jul 2026 10:59:30 -0700 (PDT)
X-Received: by 2002:a05:620a:3944:b0:929:7356:2e51 with SMTP id af79cd13be357-92e8b29ea49mr2099257485a.11.1783360769800;
        Mon, 06 Jul 2026 10:59:29 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e01c00c0sm727595e9.5.2026.07.06.10.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 10:59:29 -0700 (PDT)
Message-ID: <0c6ddedf-df46-48a3-8810-8ac36c06d507@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 19:59:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: aspeed: Correct indentation
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20260706101930.341635-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706101930.341635-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4bed03 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LetsCp1wghxSMK_TJDwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MSBTYWx0ZWRfX/vdybFYW7XTa
 ALEP+AiSYj7T/djbsurEYYAQKO9BSKIvxwt/wLz8hSAH0TtxmuU/rItu16qVtFYkxmw4QGJVcn/
 l+17XwPRCqeFyEcyjDOKJwLtxUT8W8nsmxO82FJ7YG3rdfNCYloN4kx18s7M3ezHxKXY9Cf2rNH
 czqNdB7bDXf3n72CeKmOYU32wSySpI2uh4P+2BQ7T7ktj7Ha+CQOf8lIU5h1VVWmHLjOHkORhT8
 X9nAv8pCWd7EWpsEy+//TTL3OBZdo1l4XIw+Uq2/wSkxS5SwGNCkd4JwnLCzZHCRCatq24M/U3B
 gPvjltiybueXvqQK44x+T56qSc1LAP7wQxld5eUkafiJlS/xT/iaIagT6/FjMHMUO6XEJ8r1buv
 PjTAz+ko9TYkq3EG2iGovrYGYHJarLtLjxi/zQGGL1Xql6dhTRz2PvZcvWwFALUc8LgHvqwG1td
 91mI/40DhxrNW9p4AbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MSBTYWx0ZWRfXwgJF1RiyFmcM
 bHIOSxnd37ZRzgWyQZoyNC1BXlZrjqN5INjKedeLJPCH0Ur7+q1Cxn6qpGBUxepAUj2zLjrPu/U
 sDuF42ugqP4vxuU/9JU/4UvcDIzh4qs=
X-Proofpoint-GUID: 6JHDZS6OBuK_V-0NXoAgW7zUJsp19Mp8
X-Proofpoint-ORIG-GUID: 6JHDZS6OBuK_V-0NXoAgW7zUJsp19Mp8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_105932_623638_FE6EFBDF 
X-CRM114-Status: GOOD (  10.26  )
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

On 06/07/2026 12:19, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
> ---


I will have v2.

Best regards,
Krzysztof

