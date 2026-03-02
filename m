Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7074CE9B36A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iakgtPa+B+gL4j6LtSxSC7x2QZ9CUfgqR2ztBBPq1tY=; b=f16/Pl4Ax9fZDiWJ/ohrl5ZtIu
	OS75xg6QDIDPOUnEyMfrfJDMxw7SD2R0CrItsBFTOImiLBwYuRu2NL9MDWagDWONbv0FlC78NAY0S
	WRF9bped/7oepIFA57yTGwRgYIXckp/LKlzBzVJ5c4dFMmyT7aFnABfDnrXLuj8N9p+jQhYjgf/eR
	EMO5w8yUoqZAi/anFvFrZUusUxLmDpCSApvO/wqTSPrkYAjtnIsOU1MX+kmFjtNm42exqDulDGt+y
	ANeiH24lAVOjg30S7cakTKjAnB3B6RdyX35CQg258JXygb8P1Uh/ZpofTXn5AKMRucB6jxJbYQ5Ir
	OaoF8L8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2JR-0000000CvWe-2ebM;
	Mon, 02 Mar 2026 12:23:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2JO-0000000CvVi-2ugD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 12:23:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6227vRoN055231
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 12:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iakgtPa+B+g
	L4j6LtSxSC7x2QZ9CUfgqR2ztBBPq1tY=; b=D0uMnRZymHszqAH6SzGCM18q4Uq
	WAti+bU8PpyFKG1SR+dMkjk+1aHHBOl+SSG3gtUUJ6PmCaFzTy0s50GMV8Z0H8VD
	w9+WqddAO1lJ5u+41A9p98sKLgqXukL3ew+cALQsPJSDCootvhngVHfc8qQg7Z4C
	N2A8qghMk9nIGbb3GqZuZY/ZeNpFIDB171RXBA2i5c7eu1h9QKqll1h5RfG/ZwT2
	5xvlfnRevzzub2SRLxpjdeqDGe8DRzBnRyzs7L1ZxORouyoz0AJAkLtOQgb91xcS
	FflOwmge3sn9jA8+KpWcLcNpjm2CKHD5xj6GAQUSIRdCuw/p//jnpp/AqIg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw64aaaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 12:23:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so2857824a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 04:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772454225; x=1773059025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iakgtPa+B+gL4j6LtSxSC7x2QZ9CUfgqR2ztBBPq1tY=;
        b=FPuUXPoyUDuMV1pVGYXsg3YFJBBFm9NZSCsfjGmWoTyg9fTirC7HhcpX8PYzBYG4K1
         NSZ2fUSRwPHbuzNoekqFFGH7Zt6/y+wtc5OPFx9AXaca4Mis5l9C70oZgQQyjtW+hI48
         YwRhv8yuKRXei7gffXJ6L4oVNIu4cvcM+1L865WxPcF7pyM1B3TPUriCbSeiSWic5Xcs
         oTbToeBqfJ4Hdi/sGkHiJLZheSVxFwHAgfoGu4gmPlZiQWoW2FtLPNJDd2Z+DyWNlDP1
         DywldFVlpk19onzyPNKHeCHGiwUDbKjsZr5FkgHvGhvdzIJ+nOrtFcYnivQoQJbWGMmQ
         TPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772454225; x=1773059025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iakgtPa+B+gL4j6LtSxSC7x2QZ9CUfgqR2ztBBPq1tY=;
        b=HrsIC5lt9HtkSEH4TCooiD3KbFqJ9sqydLjjjB/U2SmAA1tRmHAS3KQhC76Xqf6LhQ
         UP3w7Czh19X0r784BDh+MHNjx5YWRSeUmFxsCyokmHrD3cqPHmIheMnYXt4tV3dVA7T2
         DzOniK9B6uIbyAx8xHnYnBvVM6YulRUatv/7dm0FxkiQJj7PalnCJ0knEfQS5oFeieuy
         XmjCGVY626iWlhh92KH2cYg+nI+92CBGB/fmZYMS9x8JDffvofjta36pDOwoSYf00l6x
         ++Rf+wk6Lp1FOWJR02ypYrXVK/yPT4/6oXK0/uxC51FWEDKrQf1MJw1lbjnYq//1u34g
         LRzA==
X-Forwarded-Encrypted: i=1; AJvYcCWRdw2ZMg5eSVYIiew3kRZ2NRr3jho4oq6g4H0C97RZbECAWu5GTdZk7FHAhdldfO2HmUc0EW7J51CSAoFvgvlA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+4eMkXve2Rdu6yGw3jbRywQVg+rN5xorDcy65EWuvPmqcjzIA
	eMpbqMsQVA4z4XLH+x+T/d3PcXCRJhOGeQE1ai+dfhHXH228u5+gw8cz7vOX1ayy+LwyhXWzuGN
	kly4uUJL7Npt3ZLEWpsdt/e/dYVZgEXWJDdg7lW8kkaEPefH29gjEvF/fJqifkqFWbgiET4yIBR
	w6SA==
X-Gm-Gg: ATEYQzzyiPvXxL395fMZp6ObAbOD0+mpSzdE9CQGmr6UY40T1UbMOiEVexBku3/9yMi
	lScbG1wSfoyiTsvkCItK0+T8gEagWYkVn4jerN9eoj7sWo62bGS3B7zEvdukRzlUpyguYNxkJog
	aKJJAG7Vm12/8VIYaxhDmz8n6NrOn6WgRMyy8ttDuDCKt2wiD7+Xa1uCCGh0DbshzYChoOzXi4J
	UJG0BWASU8j6GR6QPLJF5QC3R6nR2wiBkzH4BriErFDlVJJLAO36ecOErtD1M/9FOY5TjhVKpm4
	nAGj15XnNMH7p+4jhqRe3js07nKWWTTNr8K+99kF259ggt8eSCdY45thHnpUyMF8/vFjbdihSej
	xhC2xCkR7FmnSmC58tiSXwmVcvlxyXkwYk/Boe0xIDYbV0JjN31qu
X-Received: by 2002:a05:6a21:688:b0:38d:e745:83b5 with SMTP id adf61e73a8af0-395c3a4875fmr12491420637.19.1772454224914;
        Mon, 02 Mar 2026 04:23:44 -0800 (PST)
X-Received: by 2002:a05:6a21:688:b0:38d:e745:83b5 with SMTP id adf61e73a8af0-395c3a4875fmr12491391637.19.1772454224373;
        Mon, 02 Mar 2026 04:23:44 -0800 (PST)
Received: from hu-kshaikkh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm11174698a91.5.2026.03.02.04.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 04:23:43 -0800 (PST)
From: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
To: mark.rutland@arm.com
Cc: catalin.marinas@arm.com, dev.jain@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhiramat@kernel.org, will@kernel.org,
        yang@os.amperecomputing.com
Subject: Re: [PATCH v3 0/1] kernel: kprobes: fix cur_kprobe corruption during re-entrant kprobe_busy_begin() calls
Date: Mon,  2 Mar 2026 17:53:38 +0530
Message-Id: <20260302122338.3618334-1-khaja.khaji@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aaVzOfAKhQ-uLG06@J2N7QTR9R3>
References: <aaVzOfAKhQ-uLG06@J2N7QTR9R3>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KjlULoG8JXPLLjJ0TU0X35GP58buWrM1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwMyBTYWx0ZWRfX46ySImYEj8FZ
 1y8qWvCwSz4XfY4qRCqlWUhR64T13a7FFSy4vq0J0T5pSPraHCfvMj8H/ll63yz8DqMeHduv9x9
 XvE1/DNkSugRQ/yYWU5uLadpx+APO7DjS3yzvPsCvb7XzLZdlaQzeUX3bHEzioa2oB3niC7cCYm
 /kuHvVRUfWlbwIkKIxSSouayGghkxueAvFt0QRfk1X5FCstiLZlIiMNjM1u71w4hjNiSwQNVaDM
 8TYCWQRnfrR+qPLpbp9LKKwTa8bxn+1+0TmXTq1seC6Mo5VbbF0Mj4NTrzpCywZBotVuc8HBBV0
 wdQmiOFPshkSTFcmayKkeXCTmRAlHSU97GzXtMoQvuliCwDGRY6rYCUAeOsjxvjKAwb/NoaXOEJ
 o5xkBHMxULAB8E7j/+f0Va3hEKxmmIhIZIf8Gu4fFki6nGyyPl+mif2rHBg1XrjmLN4f8ymNn//
 Fq+21hE6IgqdJKmHEwg==
X-Proofpoint-ORIG-GUID: KjlULoG8JXPLLjJ0TU0X35GP58buWrM1
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a58151 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Qg-vnJ1EYDfYGZ9COi8A:9
 a=zZCYzV9kfG8A:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042346_735842_D09FC6B5 
X-CRM114-Status: GOOD (  15.98  )
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

On Mon, Mar 02, 2026 at 04:23:46PM +0530, Mark Rutland wrote:
> The el1_dbg() function was removed in commit:
>
>   31575e11ecf7 ("arm64: debug: split brk64 exception entry")
>
> ... which was merged in v6.17.
>
> Are you able to reproduce the issue with v6.17 or later?
>
> Which specific kernel version did you see this with?

The call trace was captured on v6.9-rc1.

I have not yet tested on v6.17 or later. I will test and report back.

That said, the fix is in kernel/kprobes.c and addresses a generic
re-entrancy issue in kprobe_busy_begin/end that is not specific to the
arm64 entry path. The race -- where kprobe_busy_begin() is called
re-entrantly from within an active kprobe context (e.g. via softirq
during kretprobe entry_handler) -- can occur on any architecture where
IRQs are re-enabled before invoking kprobe handlers.

I will verify whether the issue is still reproducible on v6.17+ and
report back.

Thanks,
Khaja

