Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31552CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 20:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:To:References:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uh8HWFGgvQRh4YRN3fk73qzhec8r9FEUaHUe0C5PvU0=; b=FsbFa1Dkvl8YCD3KL8IsLt/+JA
	42JG28nps3a5b0MG2rEazKe4Ihyqp4AlpJfqmXdvuLVwrGyGfVeda7jHyPYAEtjMvOj4564PWoloh
	s+TkB1fzCpu+Kis8lS6QceZOK5s5L8H05/ignf2lPwwLc4ghDo+pFB/mNUnwjWB+xOvqw98P6L3R7
	skqwDQxj4JTp2pq8t6jH74abwjVQ6cIGbSDgjNPyKFsypv6fWYp8B7ngK9s7Z64zYwlunj4yoTGF4
	mP9S3WERKvg/ppacgZ9AZ+xzgkGiOTzKfTXZ1TpDaJMaxv8ANKQQYcQFHSddyYaijSvi3M09haIhW
	YFSoOdXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxAGa-0000000BPDb-1FuR;
	Fri, 12 Sep 2025 20:21:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxAGX-0000000BPCX-2uyk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 20:21:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CBBMrX017536
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 20:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uh8HWFGgvQRh4YRN3fk73qzhec8r9FEUaHUe0C5PvU0=; b=dpFzoYMZG1v/fuZZ
	2RiOHciNexepsOY2/E+q6hirgSIhID69Ou8BV9gf506j3uZg5Eyg1aOZTn3HJATt
	izsRV0N8KIa63NihYzi/wdKIsjrvo3Q9Mstv6cveN0mG9y+W5uIkQAuk5nZ7SffF
	SCpZcWhk1ehi5VrtLFFghTgdwVZiKX9kSYL7uICiT22ybmcz6YAkKtxsSRmAe46V
	WsgpfZhH7ssf6RKCR/Cv3ITFT9Djgj10pxJzXJdkSQCZfcpynUiSJu1TjunZY4Tn
	gHQFfBhtAm14Oyd3GlqhuFqV543caaNYYs6ltXn6svrV/nHakTrpOIqeRsCGuK+w
	BSNxYw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494jdx1c89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 20:21:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7727edb9d3cso1840747b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 13:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757708463; x=1758313263;
        h=content-transfer-encoding:in-reply-to:cc:to:content-language
         :references:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uh8HWFGgvQRh4YRN3fk73qzhec8r9FEUaHUe0C5PvU0=;
        b=aDaL0+N7D6PlTTkS2i2STOxBOZ8PlnwnlofmgvXR01BZseYQq1R8jIAiFttz0TGzpB
         jRbNNspbG2cAjpxwjYir48742jVZJuozFBXTQWAvDJ8PMC69yroE2igYlUj048O5EAIV
         hI1sxqP3AC70KvJGtgy60Ogzq3hzWS7H0CELO9OxCUPf4dgnaoHb+p5/9qKmOkxdmztK
         IpFsITfajm53+NZLIyFBxa1i5gnOwsl/f2f/Q0x8Awa/NLmTwzgVby2mgNG7BL/OTEsC
         y4b9AqIDBUZuDJ/GYGi+zpI1o/GGsOaDLy7z+NgIKA6AZQNKacvYNXt1SZt/4Bd/FT8C
         zKLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs1vkW0EH/jUsXeqGBVVzrBZFcF4gRyF8lTJpjwFrZ23FR9UkCWwfMCstMyWnfR2c5StJ76uNWgirlSI8/dIum@lists.infradead.org
X-Gm-Message-State: AOJu0YyzX4odIid0vOERMsHqFZDkq8fXtms+3iK270j1oYZesofl9qDA
	RKn1G6EcQNLu2E5fXL7aZ4STD1vkchrHsrzOuXpkk5XPOn2Kur6NZSqURr7poSL4ZUvDr4BQQho
	oPrjETCl/a0mj8BNFnRwSLBckt3AZJ97BX9JX/UX05xXl9A83LKr07q2kin1fT96OAPOygoowPd
	2syRo69p98gg==
X-Gm-Gg: ASbGncvZDNy54TKwVpaVViFQQ5HuGcfYdyAQc9CLvtpZVKTIVcKmJy/dddWxFp6gTbP
	TCAixXi+Bi9wI/38+qcjH7hskWs09IugsSxIai6YIYZsECitCD4e9OWv8Qq4Kl4T8qCJMUIZRw8
	69kx5o7J+0gS0c92MLBpczNZENZlNyGeTR8ABUu8ovIT9P8xLqpF+AJu0I+9Ow711HQo4+CULTy
	+EWduYEthij5BZWeLUNOkLC8+lRftwm5eolCkVGb7yWeqqfhmZCVGIQQ1ePUMBwWAHdC0wxtbNb
	0udw6qq9qzt0g0y/54tcc0nyULUHiJcVFggu0UFpQXzGx7K6BjUICIhQd+BTFXUHpcX8R9NAe3X
	qPGozvlm5uCOmk1n5OzcoFYw=
X-Received: by 2002:a05:6a00:181e:b0:772:48c5:c75a with SMTP id d2e1a72fcca58-77612091649mr5033556b3a.13.1757708463022;
        Fri, 12 Sep 2025 13:21:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy9rA89rMg5iy1ZfZgFDowhXAj7A+YF9TJ6xmj3kp84CbPWPd2rihyHVZcOIc16agMz/VevA==
X-Received: by 2002:a05:6a00:181e:b0:772:48c5:c75a with SMTP id d2e1a72fcca58-77612091649mr5033517b3a.13.1757708462327;
        Fri, 12 Sep 2025 13:21:02 -0700 (PDT)
Received: from [10.110.61.161] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a46eedsm6317156b3a.30.2025.09.12.13.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 13:21:02 -0700 (PDT)
Message-ID: <86bbc54c-3fc9-4c6d-9f93-b684634121bb@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 13:21:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [RFC] PatchWise: Unified Static Analysis for Kernel Development
From: David Gantman <david.gantman@oss.qualcomm.com>
References: <3aa87758-1899-4f7c-aa17-2330e656a467@oss.qualcomm.com>
Content-Language: en-US
To: workflows@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <3aa87758-1899-4f7c-aa17-2330e656a467@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDEwNiBTYWx0ZWRfX0RQZx5Z8kG6O
 ziGvcRbcgv+9XhG4YLw93ItNyH055QTODnPCbIjNEUpecKz+q742K3EZoWrpLWPMqmioZomxCAT
 TSE1S8TtjoWGlT1yamrC+0fOHXELUc7vOrxCS0BNmYUi1gdCyozM/wbga6oxg5eibZx9PWW3TeP
 4llbRu/qfDRj+YprpT6Xo4ajYdmHMzCob4ZKH6moKREfBWSd+1Q6v4UlZnvxJ+D23zjWJeTTNzq
 mrpXrfBarfF4FY9SpERGJrZl2k7ZzlWZGo15OmlS3Ul6RxCO0VlangaeUUsCFZ2yDoGcL2u49eN
 /i0i6sM2XlRzivmJMoAErlhEL8FLktyjqE6kJvLJRMAkwHLbp2Vf8eedj5Z5nxBa6j0S7NaiyDU
 P1PTkiyq
X-Proofpoint-GUID: tHZ3S6E3-9bz6uNxq3tmnF53nfk-TmNh
X-Authority-Analysis: v=2.4 cv=JMM7s9Kb c=1 sm=1 tr=0 ts=68c480b0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=_2PzejVuNbwBRFFAgkYA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: tHZ3S6E3-9bz6uNxq3tmnF53nfk-TmNh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_07,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1011 suspectscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509120106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_132105_870361_4B1F4105 
X-CRM114-Status: GOOD (  13.84  )
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

Kernel developers and maintainers often need to manually run
multiple static analysis tools (checkpatch, coccicheck, sparse,
dt_binding_check, dtbs_check, etc.) and create custom scripts to
consolidate results. This leads to:

- Inconsistent testing environments across different developers
- Time spent writing and maintaining custom integration scripts
- Missed issues due to incomplete tool coverage
- Difficulty in reproducing analysis results

I'd like to introduce PatchWise, a tool designed to address this
fragmentation and manual orchestration of static analysis tools. I'm
seeking feedback from the community on this approach and suggestions for
how it could better serve kernel developers and maintainers.

Key features (All Optional and Configurable):
- Unified interface for checkpatch, coccicheck, sparse,
dt_binding_check, dtbs_check
- Docker-based execution for consistent, reproducible environments
- Simple installation and usage: `$ pip install patchwise` then `$
patchwise` in your kernel tree root
- Allows selective review execution (e.g., `$ patchwise --reviews
checkpatch sparse`)
- Supports both individual commits and commit ranges

Optional AI-Powered Review Features:
PatchWise also includes optional AI-based code review capabilities that
aim to overcome a key limitation in automated patch review: limited
context. When enabled, the tool uses Language Server Protocol (LSP)
integration with clangd to:

- Generate compile_commands.json for accurate code understanding
- Fetch relevant function definitions, struct declarations, and related code
- Provide context-aware feedback rather than superficial pattern matching
- Support multiple LLM providers (OpenAI, etc.)

Important note: All features including AI code review can be selectively
enabled and disabled based on user preference.

Technical Architecture:
- Python 3.10+ with pip installation
- Docker-based isolation for tool execution
- LSP integration for deep AI code understanding
- YAML-based configuration
- Rich logging and debugging support

Source code and current status: https://github.com/qualcomm/PatchWise

Upcoming improvements include patch series support and Docker-based
dependency management for each tool. Open tasks and planned features are
documented in the GitHub issues for visibility and collaboration/

Feedback Requested:
- Tool Integration: Are there other static analysis tools you'd
like to see supported?
- Workflow Integration: How could PatchWise better fit into your
existing development and review workflows?
- Output Format: What formats would be most useful for your use
cases?
- AI Features: For those interested, how else can AI code review and
commit text analysis be improved?

Try it out:
$ pip install patchwise
$ cd /path/to/your/kernel/tree
$ patchwise  # Analyzes HEAD commit with all available tools
$ patchwise --reviews checkpatch sparse  # Runs only specific tools

The goal is to eliminate the need for custom scripts to consolidate
kernel test tools, while offering optional advanced features for those
who want them.

Thanks,
David

