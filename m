Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9D3C98325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eaED8Dj0FArN5pZ3q8CQ/4V/GaAP65mI/2pqKsEpiWc=; b=ug3AhwPIafhr9k8l9q2YaY7knX
	Aajg7MX4GXpcatCkj9tA89gd+rMTq8K267SAERgMFqCB/whOvD0A23IgaQODKYkVoKpHb1ebBw6Vt
	YjY40ti067Gdxh1Hkfcs7i3COjrvoTzIWurbOgsQJ46lkEeWGFzwtitQBh/RjZ4dk1Ex5QVtNvz9A
	lBlapnfQ7icVC6q67u+sew4186HAdoe2JiuiimaYSznXMJFOFoQhHtu+LqoW00WiC8IXEuuf55PqQ
	Yc5PIljUF7sxEy/sJUT6zUN9D/VXiNYAUCawd/5OKDc85UI+0oPydHoLH9qJcuCPDYHD5+rV4CAKJ
	hw6qhm5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7sw-0000000Dng9-3tXV;
	Fri, 25 Sep 2026 15:30:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7su-0000000DnfP-08wV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 15:30:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PEAa1D600037
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 15:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eaED8Dj0FArN5pZ3q8CQ/4V/GaAP65mI/2pqKsEpiWc=; b=cYH6YcmxSpRbVDv4
	ASqOTKC8Ww3v7g4z40EX0CE80WVfVuMpO91dMVOjuCuMlVx9uakw8rjWxzSslUDi
	BxN/hQ3cPv4pIgMMtjhGcO6i2V7fvzPCApLgzZ7CMvCmcjQdclp4ppbCI1HBqaZs
	FIJ8kJaIBmcqRNS/2XqCkmNCgNbY3uTJzlwIgP+GIzIwjeW+iA3w0cZiuYp8dRP5
	n/ZbiKIwYy4uIhZihgp/w33uHKm1IbjrBHKIA6o0TWOiWmKhd5xUqak/wbExlYaT
	LlkBLdBX7UFnVJeJ0kFaerkJcMU592JHFDqolqv1SlyNUkql+l0Rp+usn5MJ4aWn
	eUf5Lg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvsxn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 15:30:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so266857485a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790350246; x=1790955046; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eaED8Dj0FArN5pZ3q8CQ/4V/GaAP65mI/2pqKsEpiWc=;
        b=efFclZ5LhjaTr2GvZRUo1CGE1izDA+JDT5sxCUf3Y6i0q0tWNa5CnLh6QexDfGZRwS
         EagUJ3mLUgttMQFsuEc0SpOXivf+qxqzxjmXagDMLSKEqpveOatdXAl2Xfz+MbxN6iDU
         uU5sdclYUTzrdR8R/U8Ra9IcL+SweFAWtdTcWCJBpNNtEvcJlI37ULGHIYtrybTXdIEd
         Qj4Fkv/3qaHLw0SiGnzo4vbyAqu0mO8wB11oW3y1ofic+DEY91Kt3JHh6r/DFocgPu8h
         EC2ejdF6MXduRk8oCcfKqsBo0yHHnPMYo5nQIiuaiHgOQYrDdWz04CbYyqJoA5oHRI5V
         jJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350246; x=1790955046;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eaED8Dj0FArN5pZ3q8CQ/4V/GaAP65mI/2pqKsEpiWc=;
        b=H34fQc3EC/6b5sGS9Zeqt5wD/pU205QqTtExi4wUkhEHhfFlB87nsBlYtIafhMK3nm
         /hzjgjgm7gmtz3Mp8AbtW5gUjLN+5Awl7HCZJTrYFlnr+hp0hrt8cM5ZadzMCiFDJaKe
         tL68+Kv8OAi7Es0zyBV3KUscE6D/y/1IZfFfdpsNUyQ19cGUDgNSlFr8Rm04UzO3GwEN
         UO1t2edGW7xBFga83WDq6ar7M2yMePb/9MtqUD+pwuVnTck2B8Wlh3pfTvRoNew3XD/m
         RF95GxDCQyfSuhSZ6fOz2tmHc8HO6TSVgEhbc9q5tbK+wxsDwTa+FibcfceQyucUN05/
         5hrg==
X-Forwarded-Encrypted: i=1; AKwUvByVrHQCIfTY18SWO1lm9fHKavkgptPnVLbxBEzQIJq+dgn1om8DtzGjd44RhumvJ06RqBX3dsKN9boLtwQMjFs9@lists.infradead.org
X-Gm-Message-State: AFuF++lOSgYCf1S5XUWhsUUZaUN4tNAAVBtEseKOM6CWE994w4My0/vl
	km758GI+egg1yLRnXohdl3WiwoyEpwfAqfgQNyw3kwlNrofohuXuXBKHbdAqvapCxJabIKkfCw5
	+sxM8X3g8b2fPoppvZj4Y3ERTSqbJO5tRg84QrEHKfkvD7/KwBJfX5VKIpfihS7x5n6qEm43Vg4
	3oPQ==
X-Gm-Gg: AYBFou2XJrkfVFgf7RXrjOdhGwyml0SUUBCO9Isq134qAskzY2xjv8dKwHcULc6sIhs
	e6i07wif3EGhZBmDBI6MYiVI42j/JaM6i9IjmQJNtpVRbixaTKllugO066ev9yrOh24cMjpWT3K
	NZSSGP+6ycAEczjTg7nnJpHzKXzOtVLNr2IeI21oPylkCYa2O1IO26eTQDlU4vt3TM5DSocG5ND
	M6CiSGhjN9zjX7SJ08UFEtPwYQ1891ChNSwzxcYpL7vHx6pud5GCucAYEt23JBFCyunADF545QK
	0aC9C7QW1fWThtPRx6kZgwd0OX/vPrnu/wgVN0PxaXuBKO21zcG1vd8UKSMpI6r1b8ugkxa8Vgl
	FDdACcvKu+8y3etOu0sYZ6rRU7oMpmC6498bzM746nFB+n3ueg+5Nfg==
X-Received: by 2002:a05:620a:2915:b0:939:d5f4:ab5d with SMTP id af79cd13be357-93c47498881mr439176485a.33.1790350246413;
        Fri, 25 Sep 2026 08:30:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:939:d5f4:ab5d with SMTP id af79cd13be357-93c47498881mr439169785a.33.1790350245846;
        Fri, 25 Sep 2026 08:30:45 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c44972febsm205040785a.39.2026.09.25.08.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:30:45 -0700 (PDT)
Date: Fri, 25 Sep 2026 08:30:38 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
        sudeep.holla@arm.com
Subject: Re: [PATCH v19 6/7] firmware: arm_rmm: Ensure the RMM has GPT
 entries for memory
Message-ID: <20260925083038.000022df@oss.qualcomm.com>
In-Reply-To: <14c6a10d-2891-42ce-8dd8-9745be2f7347@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
	<20260924135201.850038-7-suzuki.poulose@arm.com>
	<20260924143821.00003491@oss.qualcomm.com>
	<14c6a10d-2891-42ce-8dd8-9745be2f7347@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3FLIdeDBfzbET-vcD56usyV5n2su8AwA
X-Proofpoint-ORIG-GUID: 3FLIdeDBfzbET-vcD56usyV5n2su8AwA
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab693a6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=CGxCOrlZwYKUQMMqFN0A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfXyrlpU0Sr47UC
 SAC5yYYKtdzpfsPGMQHe1AA7+M9hlJOr7vElm9/uoo93oE/NdBAx4bk3q6ggtHqDpnkPkX6b9Oz
 2k0fOJk9+oywKNULt+VCWwb1MDVJXoI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfXy11YMJjJ9SlI
 YA8hi7CxKX25Zf6Qo4slRwpAmbNHx1WKPgYiVaT8Zhh7lTDpqebbos9ZaDrrbn4qnuKLMADSxTS
 aDSDNdtBEzG3jsfVT0u6mftioDjt+WmEPiI0b8LFyi/iQEoDBroU0DSCBcanoCz2uVL9xrR0fv6
 YD09K7hxn012UZe1EDexpn4cyG+R+RHktenySDCKYGmT9v1Q+1h6V1XeJZboH60/UsDsG+JfGMi
 gUVEPPXqJ0QzShgAmiTtZ9C+iEG9mPZbBtO0xVkv8y9Ycx7ZjDrSZDLJWGL7K8D6U/l/LgaXWOv
 ITLNN+8aQGJbUJFRKyaxAXacI4rTJIwAiI6sOtlzxnqM/h0NBbppzU2XaaiHA74WVB19zinlo6P
 nA81shrG3yJCDxEqmNM8Z0zUkgNknX5dkBRFi9qyetK8yafju0RvXQWp7C+XhEqR5QBCDRU9q6+
 yi1Q8joE1zRL6NWBjsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_083048_203481_F1E257C2 
X-CRM114-Status: GOOD (  17.55  )
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

> 
> >> +
> >> +static int rmi_init_metadata(void)
> >> +{
> >> +	phys_addr_t start, end;
> >> +	struct memblock_region *r;
> >> +
> >> +	for_each_mem_region(r) {
> >> +		int ret;
> >> +
> >> +		/* Firmware-reserved NOMAP regions are not usable system RAM */
> >> +		if (memblock_is_nomap(r))
> >> +			continue;
> >> +
> >> +		start = PAGE_ALIGN(r->base);
> >> +		end = PAGE_ALIGN_DOWN(r->base + r->size);  
> > 
> > Add a comment on why rounding down.  Doe we expect that to ever be relevant?  
> 
> Do we really need a comment here ? We always deal with PAGE_SIZE and if
> in the odd case this region boundary is not PAGE aligned we stick to the
> page that we can use from the region. I can stick in a comment if you
> really think so.
> 

Ok.  I was mostly thinking that it was an odd thing to happen.




