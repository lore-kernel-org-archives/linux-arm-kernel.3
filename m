Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3FFE9B34B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfQRBkCngjkgAyv5OvC6CZE+GMh0n6EWRbZ+V/+EGC4=; b=WVXCEby1AyIda1
	ZR2/Sy00uqYkOhvY8XOP2ZUkSvd0K8TfAGezVvDZU+4K9X9xkk7zbwjQjp2tgdwopZOw6THDj+4Ur
	AWdm9hEQrzcySMMXOUdu7KZ8sMMg6SP6o7wySWeeJjPwxhLiaUDNTJRlMuOHTeZtB1AD0v73LjcdZ
	6f9MSqS9KJf6jsEpHnmctPrhvcet2jgjJmB9FJvyu0+5rS0ObVeh1Fd0FW8+IN9gaz1FjeP6qwgQv
	kJNBSju6HsJhEJpedwzJ3Znid8+bnmTuCZRiiskFxpfAQiPj+eFhbpPkHHISc9tyq42li7k1uczW7
	/ygefVHMUbTaG+TAb/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0Mu-0000000CgVM-2Rpb;
	Mon, 02 Mar 2026 10:19:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0Mr-0000000CgUW-39lk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:19:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6227sqYR179376
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 10:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PfQRBkCngjkgAyv5OvC6CZE+GMh0n6EWRbZ+V/+EGC4=; b=idQ5aVp8H+/ed3x7
	ZlDRWA+6WjeHMREo9SQXYqNA4HL4uCyAnFBDG0mo7V07/O61TZM8vc8nY82yzb90
	443hNTnirzoWPH4t46CG7059pV92d8Wqc7I+jd7m0/jwEdkFcBMi2WGYw1EOkr49
	UVwsupNPCUp8dwLv2gx0674LWt8+hEsNbVLOov38urEPlnXfJsZ/GXfgXyNxghat
	i7+KY+QoioZhSFMpSLvCmbRtPT37MH+YXv8mxxaMTS+CYEVs5CCmTHSYutq/C3xT
	h3Bw59ejNnqiWaKiC+EorRlD8HXOKuHvt1PBoji14F/jiqJG2ufGVwnlT52311cE
	/myo5g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw649x3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 10:19:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae50463ba8so30514755ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 02:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772446752; x=1773051552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfQRBkCngjkgAyv5OvC6CZE+GMh0n6EWRbZ+V/+EGC4=;
        b=ESrT4IxbVix6RyowfiLC8r6i5CJKf3o3l3ZZD1PPr2DWr6OxFlhu2oPg8jQu9WmmsZ
         HpSKDxad66D3JQkhK7KRQSn+s9aq+vPaQqGyUZoq5JdGtHJVpfzItcIsc5kywTe2lccW
         UkED2DGWt2xgBioAmaSk5a5gy645Jr5zmYoMg8Lwu7hx24KmQh/+vv68RvrRb45rTJGf
         eSBqnDITBSF7mXI/neFeCLIaStGdO0ZyLR4tGE89aWw4zMZA+iTgZicOc6OduynOI8N6
         VEqavwR1Lbt9Nfa4lJ/rHXKqpsmnwihryGS5q6hhVMtriyYDmhgxFVue3Qs0tZM51CT6
         haug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772446752; x=1773051552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PfQRBkCngjkgAyv5OvC6CZE+GMh0n6EWRbZ+V/+EGC4=;
        b=V4KkkOpt5gIBW8ONrSs4AfaGM8qeF4yYrSB8SqYAp/ip3yNysoQccjugInlXkVzGBm
         p+lYKW0LVY5IKPiC615FF58TnVp5dd2odGXbXjnUrD1tqkqWYAM9OLFyvD1pRAFVXTW6
         B6yGfmdOB2ClX6bR6XWCuYSFQzOqkGa9Yz+Fqet5gEAMgxFufTS05gSyx7ug2Y7XA3GH
         Y92O/fYruYyKQq9iHOVwuPKpOI3r5tRRcVxtwJQtmRs//FoxdrJ+Abw2dsBBYM32OSCM
         u9etd7KSQ5UWocu5PWeSPYulYNw8NQKbev3OhCQOcPeIPb+7uOicgtw2NYp2w29XEQSt
         bD6w==
X-Forwarded-Encrypted: i=1; AJvYcCUQ9aopK8a2wlCIjKhv7tzbA6w5QfyI8SBa3FvCouhgKgN7BtP7uyJv2xDixuxeTZP6vEaarvnT0ZBbIm0Xh6b2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7DY3AiCjKqwZ5+lm5dtKtrvDBYWn8ddxD8srxSLoAdfA9DBZg
	ykW8UjAZDSma6hBmwpIR/tchj8EtCSd3SZyKxCAwQmjX5FYUy/b3I7CU1T5zliT9W0sWJYIU50J
	1J6CXo7faj8CKyKmRwFOjrPulbwvHlz7JisGn8KTp9oQXjX2LfnR6x8LFQ9sGv7/PebePmJxAyD
	hgDw==
X-Gm-Gg: ATEYQzwo9HkoyeYvQj+QSGEme/g09uKylwrFKcE3qo7k/LGkL4mwvvE7OwgIzjKsiFF
	24R6dz2ubnrfHtVrO4F0gntlvP4nLD8UCwcN0U3cjf4cs+gH0pCgNluttF6TM4Es5EDv3Ss1KYU
	gIpF6vxf1Z0n6UUrHC+IyIViWGsFKE60PxFNBiE7d3CdGmTBL57/5h58UC5abUd2pzWDTnjta9o
	/Xgg7DO7ufXzzYSz3TiwDuiEP6VLI8CKmEbkx2BFE8sbO1WM3edL7outRWMT4dnyI8zB2IYZ8gQ
	umDPDN1BBYSS2sQXN2McyxV5H7EfrcE05Lnq/19HswR0Lh0AbajDkjsYsV75iJN8xbBSF+uYwY1
	dBqE9p7hIZQSHJsFmH8gd0kfhZopTudPdWT7gcarqodh8wWeNZpxU
X-Received: by 2002:a17:902:f708:b0:2ae:4847:cace with SMTP id d9443c01a7336-2ae4847cc94mr51831065ad.28.1772446751962;
        Mon, 02 Mar 2026 02:19:11 -0800 (PST)
X-Received: by 2002:a17:902:f708:b0:2ae:4847:cace with SMTP id d9443c01a7336-2ae4847cc94mr51830795ad.28.1772446751504;
        Mon, 02 Mar 2026 02:19:11 -0800 (PST)
Received: from hu-kshaikkh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b53f4sm131326715ad.18.2026.03.02.02.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:19:11 -0800 (PST)
From: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
To: mark.rutland@arm.com
Subject: Re: [PATCH v2 1/2] arm64: kprobes: disable preemption across XOL single-step
Date: Mon,  2 Mar 2026 15:49:05 +0530
Message-Id: <20260302101905.3591689-1-khaja.khaji@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
References: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: a9DEOCpRsfB4Y6bdkDm3lPtY4y8nGC40
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NSBTYWx0ZWRfX9tFguwRmML2C
 Bx3hMIdOwwYPrjU0Yo7/6a92XaN6k6BvNEn7xmL7kipMhF0LO7plq5CHjWzGKycOXNYvZyKYMJG
 5IPwRKbQ4ujcDf3jhrRlmCSrYa/YCe7AqAF1iQrMXOvdFzZOXADqOX9lq1NfJXFhGKXlSm3WJoA
 pyG2wzRtlfWrjtXRxAek60nvnmDoD0YgpPCbB9TFRqW6+HIfwIa5N9TlbbEh6rY/duZb0mNz8tK
 nNRvjS2rxc9P5Bxl7VTv7C6VjIczgN/WRPpboJxXjq/F3zC2JXN9G98CScdYtC8DREfdyVXvjsX
 s9REKzsQ+uJrrG2Kqs8Xi+4dFTWIdJ/ZqtKfo9TW9PzmIuPFPGnAjqZOjXaXsY4auYGFXmUtAii
 e6zaR/pl07oO/1JawGYCnpPxpP8st7GbwDur37u1WlSb43fLsGIgrxhQufciopejI3vupgj1qxu
 FLto0paeUAU6eE5TBhw==
X-Proofpoint-ORIG-GUID: a9DEOCpRsfB4Y6bdkDm3lPtY4y8nGC40
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a56420 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Ioe3sshWH7rKnnzZdWAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_021913_796054_B15E0E88 
X-CRM114-Status: GOOD (  14.80  )
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
Cc: linux-arm-msm@vger.kernel.org, dev.jain@arm.com, linux-kernel@vger.kernel.org, mhiramat@kernel.org, catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Feb 17, 2026 at 04:55:44PM +0000, Mark Rutland wrote:
> Since DAIF is masked, we won't take an IRQ to preempt during XOL.
> Can you please share an example failure that you have seen?
> I believe other architectures are likely affected by the same problem.

Thank you for the review. You were correct on all counts.

I confirmed the issue is not related to scheduling or preemption, and the
v1/v2 approach was based on an incorrect assumption. I’m dropping that
line of reasoning.

I’ve since identified the actual root cause and have a new fix ready,
which I’ll send shortly as v3.

Thanks,
Khaja

