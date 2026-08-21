Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C0FC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 03:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlIkn/kUR+9KoU2/9RIyh2hgyJrbFpNU877EzuaIyr8=; b=D3UykdmNFSVxDO7c/vjXKdbPJi
	+R3/F1jrxGvvhhPljobXwdvb0q5VfK61LfIfLpzIuyOLWXRJf/90sUU+jk4Hs9Z/fQwDybzogq4IF
	D1ItQVUGLABiU+Ev3pJ7TJaj6ujYfoW7PYQ+RMCelgQGeXsA1+bBGajzgW4anmQcV0wNpGfJIOt6u
	BV2Plgi6yhGQ8MnSLUn6vh690j8UiBbggY0DbocPp8WhwUW489X/g3Y5v6dnnWXQc5+DXNeKo7IUv
	OfL6NEj1LvoDRRa4XhJQiRatAGyOwHZUkSTH40muDoCkvFyVF4PRlm2KJckGthCy93dKEUanMp/zZ
	i68fmdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxFsG-0000000CUaA-3VIP;
	Fri, 21 Aug 2026 03:24:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxFsF-0000000CUZm-0VsV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 03:24:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L21Xi52054360
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 03:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SlIkn/kUR+9KoU2/9RIyh2hg
	yJrbFpNU877EzuaIyr8=; b=md/KYDa0qD4cvRqRYnTNM2muFiVqfmFH2z+0+YAM
	ok9vtvBEKPVUDwRWGAO6qiYn9mbuFNTP8dYCv4w9DZvawNWVU4XZ+cStkRugQnZw
	/PhGBzeD2imvfQLEKi+MqMeBG7Pg/g7CuArF5RWVhz95Kze7WxYDiL1HUdEZpUVw
	kaAXXYDCrrmx8m8ABTVtYrfWr9kEZD9KHh06zYc+RRQmbIkX4R0FeFaE8uOz9ihw
	FIWY/4JahYOMeu/ISMxK0GQUGtDGz7FkrARJf0B7/7Av3mzXXQW8eF1KFExAWis7
	3GlAVlZX6E9Vhy6eivs2hJEZCXLydOwoPIrsAyYLF9oqRw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn8cryt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 03:24:53 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744e7c36621so173060137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 20:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787282693; x=1787887493; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SlIkn/kUR+9KoU2/9RIyh2hgyJrbFpNU877EzuaIyr8=;
        b=BymhHBwGJF2jp5LKQjezVAYZgcmIvDA+JYsIoGqK9Sdaw4LOnluhhkXx1V7aG2egJN
         byItYwu8/zy+OCScRiCk07x2Sgd7/eQlIBYkh9vWf84lqrDJVImZ9+5p6cR+ALikGnzy
         qqCrcV3EaEZBDPadty6nae4gvTMbnoCMDwTWdHtX9ns9tjOs8w4tOqJZuQmqs6dbvh+f
         6zs1VW1ZWELVJIqZppgTs9HJsuBPPhkeUtXSTPjQic5twCkOj/rPAtbmXUDhbJw7ehzV
         2JVD9ufF+Lm7gPpd6KvgwzGGBu8wErW+0q7eXbaeUd1N3BY6mrXLgUryZx2XkoaxqLiz
         CW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787282693; x=1787887493;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlIkn/kUR+9KoU2/9RIyh2hgyJrbFpNU877EzuaIyr8=;
        b=GRPxVhAdu3O5vSroGkdA0uHh9G/vh5KnvXPSDQ9ypOnITg5UeyfyxWic0bL6fwaO4f
         trdiZ1my5OfAAUjANd6+ghyttHS1YhfvEfMCwChLqMG4XbWbE4KodP2liKjn8GJefPJ1
         yAYAwJsTtBzMkrYK1Fbzz96BZdgY713XG0Cy4Dsik3IguLEI4yOMGtC1LfDbpmApSXtL
         /QtipLPhMDuE8fQynJpX/mCwsPA++Xidqc/uA+/MTAzlX7fanQxQq8t4FfBcTQWDDb1f
         v5g7wTEMRH6TN4ZP4CiXnknFE0UaYZxGLgsKf04Y/obRRNLMelKpUp7AsNVy8jLylB5P
         GlsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmqMp4S8TVY65xkYNguzllWupMh0YIDIYUuOmYvnVeofG4f9ZZ8THXS1tRBqIH6ObHdhZ5xsLR9x1PrcXOCl5y@lists.infradead.org
X-Gm-Message-State: AFuF++lm7aBSxf3EJYULdpy3aH6BEP4db03GUCNHk83Nf1CA26Wez7F8
	g1hW6/8IQDGu5k+3NqFesJBubE9g+NU3h98J9Y9Wrd6O8babebu1NMAakho3n3gt6LW54QacfUT
	O6q1HUWidUzRs4tH119u7w9/vuE+zaaCvkJmwPDMhRSr603bvJzbKuKRf6wpGPI2+/40nHxXdFd
	oSBw==
X-Gm-Gg: AR+sD12xAWqWEbUCMtiKE6c67qC/loo7jB+coQ3va+pNoxJ6PBqVI24rfoPh76YsoMg
	2wjSltA0qZ+lfNrKfnxAViHJlXqCBpH0h9jnj5lmHnImYc+Y59/50rHY8AdY4reqaHGxPHLIx1B
	vK3noTMQ2NLOkyAjwVyfoYCKPKZC6y9Lfrr8ySBfnrPxswQs9Xx4vTXIgjKZU7GFCBLc3KWJRnH
	MHNu2ZGuAK4N6S2Qdwr8Gn2frSihNgAkqK1Eglk0rgErjM4kLJ/QQjASJN4Y4S/jZy2TaraAjrt
	V8aokbMs48G2XoDakhB72U4VMc1n2TVRvG1pcMlu0U5aDLfNCjyxb4t/G4E3eZJo/wOX+t6Kyc7
	J2FPgJftFWTtZU74=
X-Received: by 2002:a05:6102:580d:b0:779:dc0d:2b2d with SMTP id ada2fe7eead31-77a63642798mr1213003137.8.1787282692925;
        Thu, 20 Aug 2026 20:24:52 -0700 (PDT)
X-Received: by 2002:a05:6102:580d:b0:779:dc0d:2b2d with SMTP id ada2fe7eead31-77a63642798mr1212984137.8.1787282692340;
        Thu, 20 Aug 2026 20:24:52 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9e2esm4138134a12.5.2026.08.20.20.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:24:50 -0700 (PDT)
Date: Fri, 21 Aug 2026 06:24:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>
Subject: Re: [RFC PATCH 3/3] cpuidle: psci: Initialize the PM domains in
 powered off state for OSI
Message-ID: <3s2qeh2teckoalwqaekcs6zk4bpsrdi5ackkn5uu4qyygvawmu@k3lvlpm4fipg>
References: <20260819151457.256959-1-ulf.hansson@oss.qualcomm.com>
 <20260819151457.256959-4-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819151457.256959-4-ulf.hansson@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDAyMiBTYWx0ZWRfX3YGJ+kgVZYp8
 HWNH6S9qtSL0LzyWgEqNNIr0e3lN2Y41ONBtpHFOuKAwHKjPYHx5KL2aF7Tv6wme4ybPd7NT8sW
 CcPJ4HnEJxIzB8hClPy2nSYns4ewenW8n6uJGzLv2tjzhR7O9QUj1fPg/e2v+ngfzvN5Gt+nwuw
 5lDwIULuxaThLvs+jE7gFgcO07tIMZTkP8Vu51ByAZ/GRZyRYGBZ/GeqZn/ZWfuXpQ8uZCdrQ6O
 qkgzhnt2D68x3jh+hYRxjMSIybuZuFCoTY5yeLF+2qmKra55SDlFLfLKo1Sy5YWk45tSl9UZxA6
 Vgn+jIyqFaG74PWZftdC37JTP0cmKtUTgzcVT1UgrCj2LTtDgyb4e4PIK6jEFaw1M5kk1jX3AMN
 AZwB+ycjRY61fD0h1QjeMsKl1IfQsjtgOmY4ypEj78yyWu8pswnjmSQ5yjzZQrkt3i1Z0AJMCbW
 Si2rjwKKkpML2QZMJpg==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a87c506 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=elYLTxGRisG19N56oD0A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDAyMiBTYWx0ZWRfX5ttU5PzfPYEF
 3QHl62Pg9qaGvLixF80acv1Ov+SD10gVFjrKguSM8pqH50b8ZtK0ifiBW+7iJCgfeVGVHYSX7Ad
 Ue29tbu7cAVjH7/zFpWyEnRiMT1UjbY=
X-Proofpoint-ORIG-GUID: HzzP1nHU4GtpSCqUFW_DnApISOmEPBo4
X-Proofpoint-GUID: HzzP1nHU4GtpSCqUFW_DnApISOmEPBo4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_202455_281644_2200680C 
X-CRM114-Status: GOOD (  22.26  )
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

On 26-08-19 17:14:53, Ulf Hansson wrote:
> From: Ulf Hansson <ulfh@kernel.org>
> 
> At the point when the PM domain and the topology are registered through the
> genpd subsystem, it's not really known whether corresponding CPUs are
> online and thus if the PM domain should be initialized as powered on or
> not. Instead this information becomes available when the CPU devices gets
> attached to their respective PM domain through dt_idle_attach_cpu().
> 
> This is a problem when using PSCI OS-initiated mode, as we may end up with
> a PM domain that has the genpd's status indicating it to be powered on,
> while it in fact may not be the case. In the less severe scenario, this
> leads to selecting a shallower domain idle state for the PM domain than
> necessary. A more critical problem is when a non-CPU device shares the PM
> domain, leading to their corresponding drivers not being able to trust the
> status of it.

Exactly why a third state like GENPD_STATE_UNKNOWN would be more
fitting, IMO. Maybe something we can do at some point.

This solution works for now as well.

> 
> Let's fix these problems by initializing the state for the genpd's to be
> powered off and in the deepest possible domain idle state, when using
> OS-initiated mode. The support for ->sync_state() is maintained by setting
> the GENPD_FLAG_OFF_STAY_ON for the genpds in question.
> 
> Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com/
> Signed-off-by: Ulf Hansson <ulfh@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

