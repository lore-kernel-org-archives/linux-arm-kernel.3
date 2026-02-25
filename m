Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D945FD45EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 21:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBmnl9PJw1wesdKZ2FfBJpI0enm3lW3EvYf0jk7sk7w=; b=rmsqJzazCPVNkYHYVlMvha3R4K
	YnqH0DVY9HY9dUHoqGyfIAc+g+IezgrN3k8m66xXA/a0otwncQrdxPhd4BptnCwCSOOByeQpYgulX
	v1M0/gps82G2MMLyi2/FCVdU+28ABsstDQMmDlKqSxaoBchHJlY3ZkpZ3q8/hkezg9Gnhhsq+Sfb6
	rHQnEeHrY5lzned+BykParpUyC6SNV2HVQgaETavRPqdUr/OnjAcGFTNHn11E0Cii2imco6bG7voH
	QH3a1K3c8CkY8gHB16jatlns7MS5bLeL4N77DhkNJFJO1JHCGAAS90zbxwTUPQAHNW5EDqdKGgG/q
	qzJcOAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvM7x-00000004tYp-35tu;
	Wed, 25 Feb 2026 21:09:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvM7v-00000004tY6-3a5F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 21:09:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PGkJHT3632329
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 21:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VBmnl9PJw1wesdKZ2FfBJpI0
	enm3lW3EvYf0jk7sk7w=; b=aPLRKa94YDUOW/qMnOjRcpCcH8aILpYCYua+iSRW
	oAz+0avS3bsLqu+Or7sIXixWe1zdVa3PvO0vshaSlXLCKro7vtqWlirNpNkmWZrH
	GmgxwyIkc2ADY0hO5A8AGSPA5S+v6s9XuGkeDAFa4yPVzkqE7TCxZnnLVxgUHFT1
	3BfDm1X2MPQzsPdvIFj+fbuJU61j/J2lduCDZ0m2nVzvW1QEe8F9mVnPc7ASwZRc
	kDtUrRXDnkKY27sa4HaxdUdVKg6GFM4EUX+Kp959gwvrkRk1qkp+FC9cxJZYoC9J
	vFkU6d2moA9Ruqp5l1HKEe2pG2U5DIQIIyBpk+zbAxLHxA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj4w4rt0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 21:08:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdc5078895so2069888eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 13:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772053738; x=1772658538; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VBmnl9PJw1wesdKZ2FfBJpI0enm3lW3EvYf0jk7sk7w=;
        b=RRPJP9KK+8QdcblYz6SKt4W8UuWvQV9J1t1BxO/4jnnNw3PwfQfhnxR1SC6qD5XTZr
         weweWs2LNKw98SrZvcAV8k+GihV1mgCKz+SWamE0NK++ucpIQTFY1PRuzBoHjCNYTVhQ
         MZQgH9Pnihc9MmvH4WxsqHofIHSNu+XL+2oMrTA2fyX4UyfoTPRcR7Lo1LY7PJKBD3PD
         R/qv0QF9t+T/1wlPsdRdlkXYIutkWiWZpGDqUojBgRC9X39vqY8Ye0bv6aKSXRGxTMFD
         zIDDE+McIg/CfEr0pmZJlkgSFhlsoEPqP3Z9jVMYFGiTGotY6a4SoLkoDNP4gFkyRHf2
         EyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772053738; x=1772658538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBmnl9PJw1wesdKZ2FfBJpI0enm3lW3EvYf0jk7sk7w=;
        b=pEUmfgDcOnnER8GDyffRaZQS+8ekuXrMrVsPk/Cfqh+s665464Npnh+SqRJSAA4GQ9
         FmdAfVmiReUnh7YUoPiXVAr3HWVa+LZRj3zHMdtkP7hGr+ZuCy7NLIZsZ60FwcuAh70Z
         VBQq5JAxaEUhXpMP4liKayTveVJwVKb7W1CK4QFz5te6CysU3y845wfK9L6izUOUMypd
         Leigxp5sqm1++Wce+Exe4nrfwXI/9ppYyqzlp7QaHPo5Xo0xXBqQBZaO8nPQugx6aeT+
         WQ1PJDpcUaSCCgFsNFhsa/4N1Ga4sVdO0W+e9pTk5q8kr9xy+bka27Mk3flcDUMDzZKM
         V8bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiPOXPng/0BBirvb6gi2hRiaBWsv5l2oPEYCjpRcgkmEQKRSt/VP+2hmAYI0jAO+ffOGENpAiIkH1HjgHZuJUa@lists.infradead.org
X-Gm-Message-State: AOJu0YzwDz7iulEQ6i99/XJL8sMs5CkUTyferBJ0D1VBqrqJybv87Oq8
	tUsPOgZOq55sPWEn7OHK5Qv4gA1n79jcSp6isPhZ2qXMNrYDywiYYZ/jQFQ3u3ecdvBseLQ+VEt
	FBW/6yh50dXxxg73M+5zSntifwF68H+8Sb5iqmliYSBq0POpoHltnNLgWQR0V7EN6D6UwxdWX+D
	W7TA==
X-Gm-Gg: ATEYQzzy8ys4qAhS/nra0FIqVgKF46vAdf/zpQJj9FYDqyZFED+6l0djRB/4xkcbVXC
	0suVyYwOWa0EWpXYMYsqW6Rz5MJJ9XLap1zg0oXB7086X51KBNVdzX8hsRFTSpUM+cHw+zjkY5t
	LTA3kwe81MWW6K0GU9KX9QFQIYckV1nAezDDx7VzIJOMVrcfTGc5thBrnkdRk6HfV/aEEpk4V34
	ZOSOL0nG93TXG67J1UdKTVJn1EqwlUCir9ERISZ7bG4c1PUhHdU2SrWo1DbajBhiM/mbzn4HWZ0
	IxjcegbyN/ZL7bBCnU5JHqjeD8xMlQ9do8e236CLqvO44cxOeh6l5EahdIeT0qlGh2RaP5/j3SM
	c0oAOvnpjQRH8M5gnVXifPUWvxY6dKPtT
X-Received: by 2002:a05:7301:678a:b0:2b8:5159:eca5 with SMTP id 5a478bee46e88-2bdcbf7ebf5mr946974eec.14.1772053737597;
        Wed, 25 Feb 2026 13:08:57 -0800 (PST)
X-Received: by 2002:a05:7301:678a:b0:2b8:5159:eca5 with SMTP id 5a478bee46e88-2bdcbf7ebf5mr946947eec.14.1772053736987;
        Wed, 25 Feb 2026 13:08:56 -0800 (PST)
Received: from localhost ([138.199.100.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1df6b0asm188889eec.12.2026.02.25.13.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 13:08:56 -0800 (PST)
Date: Wed, 25 Feb 2026 15:08:54 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>,
        John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
        Leo Yan <leo.yan@linux.dev>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Dmitrii Dolgov <9erthalion6@gmail.com>,
        Blake Jones <blakejones@google.com>, Tomas Glozar <tglozar@redhat.com>,
        Yuzhuo Jing <yuzhuo@google.com>,
        Dapeng Mi <dapeng1.mi@linux.intel.com>,
        Shimin Guo <shimin.guo@skydio.com>,
        Athira Rajeev <atrajeev@linux.ibm.com>,
        Chun-Tse Shao <ctshao@google.com>, Howard Chu <howardchu95@gmail.com>,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        Thomas Richter <tmricht@linux.ibm.com>, libunwind-devel@nongnu.org
Subject: Re: [RFC PATCH v1 7/7] perf unwind-libunwind: Add RISC-V libunwind
 support
Message-ID: <q3oys2ukvylrd7xfn7267bh3wpumyxbbxpk2udhps375cmk64p@l7sjnlxll6c7>
References: <20260224142938.26088-1-irogers@google.com>
 <20260224142938.26088-8-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224142938.26088-8-irogers@google.com>
X-Proofpoint-ORIG-GUID: e8h66SRBr1Qukskd3J3EemnKUcijdWiI
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=699f64ea cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=OC80/TC5XWgnnCQ5Z9xtWg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=8mPsIthyXUsASUFpomQA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDIwMSBTYWx0ZWRfX38DKHYO5h2Qe
 cdtYl4JWbHD5cusNrXRYiVcVaEAcsfAsQ6HpyjFICBqX+PvbSMGmyRk0OdnId+t3YjcShMI/GLY
 GWNkL5kStpG8moA4+PxBXJMNnz4xeF5gGfvuF29tOSQHcncPYnB7nNzTkFiOJwnjJeOje0vJ4fJ
 uH1LRCvirFfe16r8jqrBmWIqjw4mjz17/ZFN5ZJjVZkDkytqzszoXjqbNN325gdLYDPVu5piT/B
 ETx/Ilm01nDwQW/++RFaz0+bG1J1sZ8khrkSRBh5ZytG07qH/9xSlwBepM23nycfVSo0uS/O8iD
 Ax0xkJjB4T58O5Q8kIxeeKP1vK2jjjy0JcobiyHv87EkPb99F+9icymR+NUXQ6BOcB60XpvJqmp
 pQkler/flGY96PN/gufRjkoCX5UFh6HSbKtGtYAQxRgD7vnNDrhA4zqohgGONR0bJOzcaKYRxva
 7D8enQnDDN/ofNOb0DA==
X-Proofpoint-GUID: e8h66SRBr1Qukskd3J3EemnKUcijdWiI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_130900_033166_09E5F0F8 
X-CRM114-Status: GOOD (  13.67  )
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

On Tue, Feb 24, 2026 at 06:29:37AM -0800, Ian Rogers wrote:
...
> +struct unwind_info *__libunwind_arch_unwind_info__new_riscv(struct thread *thread __maybe_unused,
> +							     struct perf_sample *sample  __maybe_unused,
> +							     int max_stack __maybe_unused,
> +							     bool best_effort  __maybe_unused,
> +							     uint64_t first_ip  __maybe_unused)
> +{
> +#ifdef HAVE_LIBUNWIND_RISCV_SUPPORT
> +	struct x86_64_unwind_info {
               ^ copy+paste issue?

Thanks,
drew

