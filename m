Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1074CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 21:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovwcz/UMx+Ei1EUDipzRJAkdj5/vHnIo3oFAfjDRoTY=; b=iXUCc2WnKQixVFIjAxsY/NmGGj
	TjGcoMCi09GuPRyGdiAF8+WFTPg5zUVeYD2SjokrLZVxaCHeVhIeAF4rbvsH2FpPm4aFWlxaTdJ9K
	uiHt5BrUAlZ/ws7cZjCKuVoxSQX3X2oTg9v+O7gOKGsyaGFwBKNhoKYcvFPd3NVMcA9UZVUJNv4qu
	MIRDAyYn5C3RivtHACUTU5cYiLksZfE6mEaXUOYGjoUTBIhAcxfML5H/W/9Uj4smAsrpsqJBj1SOI
	N52VpV+hwOkvFSVfJf5Wmou4AFdgOKYxeX/AKlIe23HTD+p7kb3F4Mm3TcF1JZf5cwbMYfUHRfMsr
	qOQ/i37Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur1fZ-0000000DDgF-3jkA;
	Tue, 26 Aug 2025 21:57:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur1Xw-0000000DD7D-1rih
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 21:49:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QLMRcF007933
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 21:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovwcz/UMx+Ei1EUDipzRJAkdj5/vHnIo3oFAfjDRoTY=; b=GW7uBFTfEjLK1VD+
	jvcelJdkc9D6ELm3oQep1HEk63GXjAQGze8wezUoodAtkr4xi+hm1vjmixN0eaoo
	ZMdPJozGh+tGniRlZKtVl1AlZMYsRqESV39zfdp1M7UVc6BAF/suWs0gP1ub7YkE
	np1pOHkTc03QgmcyS7QXDEDKdem4JpdwM2KBuaXvGuMZ2qw5gZWnIjcAIGJKrLNt
	HcWp8bTgc+WvN+ghBCrIIMgeZuUh+pgZkyxL/b9Ta1rHtyYYrb4IqkyvIG3grCN2
	HnEpw+GWEEP+WBzz3K4tDfZmphSbo8b4397190wUll7OR044RLWLhULiGcQ1ItOT
	koFGAA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2tm9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 21:49:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b49da788e53so4507350a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 14:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756244979; x=1756849779;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ovwcz/UMx+Ei1EUDipzRJAkdj5/vHnIo3oFAfjDRoTY=;
        b=B4cLvTuAopoeXYsHBXf50eBB2X3TEmJbAT6c3DtjTdMffQXi3/sWGraXrjYi2LQ+rt
         5P+N/x6Hj7Gm0dYnKFnp5aIm85Klf5V20+6ztqvJNwC1KqICeLqWJX7JQ3f4QLid12Lg
         xIdbHS1qNbtX7W/tM17DblMOgAKzUJP0scz8Z1ZHB0/gQ6dqbeMttBTMIzdXQEFmBOza
         H+lIaRPZ3Z+EyeVb5hdTCk9qUJjppPoT8WkhSOJoRDeqieIZAjGT86wfNaTjC565tZXa
         /qIqqq9SS1nWHd+QVJJtDr4NUY2k+cHqvbaOlz5wRhuplpFywTcdxE+SL+UCuh0nVxxA
         jFnw==
X-Forwarded-Encrypted: i=1; AJvYcCVgXAjGmr5eKuNLGv+2h4Ts6Z2fz2ygRrjIrJWU3HF3iMjgxgnfGyzAn+dQTSG6Ki8oYJTnXsK1vujQr9ghcSZu@lists.infradead.org
X-Gm-Message-State: AOJu0YwII7oMXwPShuU/h7NReE5TxGct/gdvX447HhfpeiVgar86Lkbb
	jjHP0r7X96Ojmmmn2MyhpTnGHF6ZVvXU922EOAUQWjQpXjosjjwqpsTFY1BjFvzqVrM7TdNZzug
	zAhcPKzWS9wztuRBT8wKfgCML8nKPNUYQaHHWy4G1l7/wcsP37IQ6qhHUxCM6MziwsBqoss+wte
	gLvQ==
X-Gm-Gg: ASbGncuCU1OcoY6V0DNIukbNrGZhEebwI5MQO4eXVvoeCXg2fyn87LCg8dhOebyZZdV
	EM7qZ2Suz+k/K/RanjmbpnN/6+nygD2AnjeCKxTFtpGGVvOwY1sj1DS0A+AZ8o3KTtULrKusslL
	VwQEW4lsU3C59MwlPSEjMUdGDKqIQsJMlCtKi2grd+PVE7BLtxAW/WUVpzR6nbeDgUeplj3p+sM
	L37GUsC1Xx+RL9kkwmxeomk69t/WV5ibPtH++Fjp79wr0UONKWPW8Ppyq2JyTm5BRMZwzfvGl2d
	GA3/Jp3UpUAYxMFd89Be7e7Sw7yys4aGHbrzyjjFJ82FDQCCVCSfjBpe3RdcFj7drR07aDER/Xa
	md8vFljOtnMADHEMuP++2im0mAtVWu28b
X-Received: by 2002:a05:6a20:3947:b0:23d:5691:df51 with SMTP id adf61e73a8af0-24340b01b9emr23163104637.1.1756244979128;
        Tue, 26 Aug 2025 14:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvW96AUyv4NFuLjcj/uDmOR3GBBgYMnkq5H/IYhcNWvdPPtmf37a1KlGOYrRmV7mrjTboe3Q==
X-Received: by 2002:a05:6a20:3947:b0:23d:5691:df51 with SMTP id adf61e73a8af0-24340b01b9emr23163064637.1.1756244978686;
        Tue, 26 Aug 2025 14:49:38 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4c1b2f5a3csm5860905a12.4.2025.08.26.14.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 14:49:38 -0700 (PDT)
Message-ID: <e43ffda6-4d25-4874-99b0-6a65fea4a261@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 14:49:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@outflux.net>, Sami Tolvanen <samitolvanen@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Puranjay Mohan <puranjay@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250825142603.1907143-5-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ae2bf3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=ZGSs6mt8D-bwwmi9yLIA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX2fUagICqeeI+
 DjEjIMm7MzkgqUSFO0XThQKNdw7MJRwGoZypQJiFczt4K7IkRB8kxRQ7upME3wWMLpSkiKw7PBu
 Yi3JxvI25v/xWAnutubmT2adQNuI1DgMP9SllPQokX4J8EtVzHKXK3XXPZNP97Cudw0gJS96qHz
 5H5ZO7v7O95j+3siG6rJ6GFqQJpj2Icoczy6uZw9ku/K4XwuruTLCi/icuLqG2ncDmfqcIidtTR
 8/DZNu7LWHu5tWqURHsDTe0y/+JldZP/iHF6K3YfzV2p4rZoJK6To/j288GG4G38SYIbHTT627N
 rlAE0w+tduw3cF9RIPjIfwOvMpEc9nLFuL5PEsEU04fvzA4/+Pq/4GUQwqtwTbWM1J90fQXx/Ra
 1OByIcXT
X-Proofpoint-GUID: CzdwA5pYKPty-v_rUqwZZefC0WqZq7SE
X-Proofpoint-ORIG-GUID: CzdwA5pYKPty-v_rUqwZZefC0WqZq7SE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_144940_489961_CB298E9F 
X-CRM114-Status: GOOD (  11.60  )
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

On 8/25/2025 7:25 AM, Kees Cook wrote:
...
> -config ARCH_SUPPORTS_CFI_CLANG
> +config ARCH_SUPPORTS_CFI
>  	bool
>  	help
>  	  An architecture should select this option if it can support Clang's

nit: Do you want to replace the mention of Clang in the help text?



