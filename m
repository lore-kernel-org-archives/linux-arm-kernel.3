Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55472CFC279
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9Tj2omosRcUYxdoccgm+YuolCAEZN/10noVoCt2ot0=; b=clwfDwvs1H7SxeoIl5P0bKvwsg
	osBkncb1X+eIfKQCWAW6wa8BCWLFvOYmeqAyIvYKI1RRRek87Jq6MUHgYnAlfCFYu8xwVWgycx/DI
	WftDZnIYPmXsCmsYCyNel3AItpZqKST0bxpWwpFvOyx9PvKj41C7gpAS/ujzzE73EjLnwOOnSB2s/
	bb+DHhrcpMtB+4xHKbNhN+2rOyCj3MJW4DnqXKpwS+6py+MS041TbVfaI29xBrCop6xzelq1k9MRJ
	IvtXXzkRQs0UR8YTod3zIS6ZWhvXmLHzG0ty2y8/45gOrc6GuNwyBvLG/CL/f2mKcZVze1jvMgEvp
	mo/dUzMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMS2B-00000008VzS-0iYy;
	Fri, 21 Nov 2025 14:22:47 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMS28-00000008Vyh-0zpJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 14:22:45 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b47f662a0so1461927f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 06:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1763734962; x=1764339762; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s9Tj2omosRcUYxdoccgm+YuolCAEZN/10noVoCt2ot0=;
        b=FjhtqYKEU2/7h7yniNNpWtk4mIqWR6uKQdVS/McZO/9p/EEh5aBGtrIzXP7mvRgKrc
         bc5wv45ptxIOUcEjfELIRT/5qu+4HPmkGTExK0xQn8XCtUWlBz5Qu99ayWPgmlz3P8O2
         IkSrK5MHfnBy+VQTLStuWDJwuX61IqLWGDWGuaDF4B2GJMMn62u6Ijm+5MZlOO+TxLbM
         Vu7D5wjUnxQeQl+rIPrSMXR78oxq1jS6Xv38HpFVWkZ3jnyNzzWri6TPN0gNhLZi7PDO
         V4URXeJrd/3LNlPuM0sg/BNNmmIW3wU4+CZ2lTgpmQRe0VhXlldARH1fB1616ZSOLRyq
         qZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763734962; x=1764339762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9Tj2omosRcUYxdoccgm+YuolCAEZN/10noVoCt2ot0=;
        b=CdtewxkCjxKp0kCr18pONAE2T2p5401hgnkmrCx9X+XCXJi45p02PaQu6r0cYmz97g
         wVz+nRMklAO2NaU3NdbdZIUzNm6ct76N7GwYGeyfZhonvyT3vsxlPj37aOdmEH5jg26Y
         Y4LjiNC2H5MBkp2AMhnKnKA42ZuMlfFN+XTbC/88lVUP5Hh6TxqhYLgFcC0jD7KiEob7
         KQc8MnGuxIVwroTWe8hBvNTodqL41V4EaGQ3klDnxKWBV01nVGRox/u+W0tf4GkEW96q
         skr8xlB4Y4k8D0IdorSncFg9SI/ijwWTR5/0EDp9mRNU23AbkkTUi2tx/tQz6s8iL8sh
         LlBA==
X-Forwarded-Encrypted: i=1; AJvYcCW08f5IfYQ2cQIALm9TQ9TdB1v+k99OnD/qCJWwicAe0EPaPhjWocPM7k/xj9IOIZozDWHDhHhq6PoowqleWNqL@lists.infradead.org
X-Gm-Message-State: AOJu0YwQPijuWFylY38wFHi2usurUu5iHkZ9c8INiEIHGTXsvpYOvQgJ
	7isnOiajKhI3/Ho54feMeTfsRdDGbgZ3CaqfdpSr9ph1Oir2lOmhvf+2O2hbgaTSPM8=
X-Gm-Gg: ASbGncuCzL/mv26nMO/FFFgwcj54BdgB9AoB+cVyiKUT/eojnVPfBywloEBwIIN/Old
	LGIP/ytD1CR3o8ybR83nec+TnBv8Cfjne7+BqDg1hqFthEBJbo1tx5IIxopF6aiX7mz699GFj5S
	L2Nb3bHVqJCgAr/2RxYQ8n2S6sv2O7jjZa0ZTepkJbGoyFR6d7pqUDXBiiZBEPVfdVbUT7KTA0G
	2RFvYx94FGd97ezA+4DTIiTVfBfsriXHJ9CqG0h2SzQO5NLzLMTrKtYXKTIb5+t7fdV94Cmw+yc
	oLAiE5a1yPfDR0fp7dwP0zvg18ZpATu81Nu6noseBSDtiyQk6uXjNjrXaqUpLhPlYzMwZc40/DB
	SWd7Ek9lO5mnwrt07/+/6WiOJ97N5ozKhQcqg2dwsJzN050OeyjhnLT4EHrI79Vagj3Tqzl1ZMs
	SMG4pg9zjFz1EQ1OKtrPdds8f3ZPZmgQ2vvtF9omjWUrMACpotUUXOuXtj
X-Google-Smtp-Source: AGHT+IEgxVbe+hqxdvbG56kf9v6CMn5g1qaPlBLoZANmK8RgRjJBLPlXoEtEAoaG63SMBlnIFP5AdQ==
X-Received: by 2002:a5d:5d88:0:b0:3e7:428f:d33 with SMTP id ffacd0b85a97d-42cc135db29mr2815296f8f.16.1763734961910;
        Fri, 21 Nov 2025 06:22:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd9b45sm11126232f8f.43.2025.11.21.06.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:22:41 -0800 (PST)
Message-ID: <9290f53d-3545-4299-9781-c1c558f71158@rivosinc.com>
Date: Fri, 21 Nov 2025 15:22:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SSE May Corrupt KVM's Context
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, =?UTF-8?B?6Lev5pet?=
 <luxu.kernel@bytedance.com>, Atish Patra <atishp@atishpatra.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 =?UTF-8?B?5bSU6L+Q6L6J?= <cuiyunhui@bytedance.com>,
 =?UTF-8?B?5YWD56u5?= <yuanzhu@bytedance.com>
References: <00786ddb6d626442879072851d455bbd8ef1181d.e1f179e9.b8a1.463b.998f.98948268e9ea@bytedance.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <00786ddb6d626442879072851d455bbd8ef1181d.e1f179e9.b8a1.463b.998f.98948268e9ea@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_062244_413860_6EB59DB1 
X-CRM114-Status: GOOD (  12.91  )
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



On 11/21/25 09:26, Zhanpeng Zhang wrote:
> Hi Clément, 
> 
> I encountered another SSE problem recently. Host SSE events may affect the guest. Neither PMU-SBI-SSE or KVM-SSE is enabled. Just using the simplest riscv_sse_test to trigger ecall SSE, and it will affect the KVM vcpu running in the background.

Hi Zhanpeng,

I'd be inclined to say this is most probably a problem in the SBI
implementation that incorrectly send or restore to/from virt context.
I'll try to reproduce it with OpenSBI in the upcoming days.

Thanks,

Clément

> 
> The following log is the output of KVM and QEMU when vcpu crashes:
> 
> [  152.228548] kvm [145]: VCPU exit error -14
> [  152.230664] kvm [145]: SEPC=0xffffffff80040280 SSTATUS=0x200004500 HSTATUS=0x200201100
> [  152.231868] kvm [145]: SCAUSE=0xf STVAL=0x3c8 HTVAL=0x0 HTINST=0x103023
> error: kvm run failed Bad address
>  pc       ffffffff80040280
>  mhartid  0000000000000000
>  mstatus  0000000200000100
>  mip      0000000000000000
>  mie      0000000000000000
>  mideleg  0000000000000000
>  medeleg  0000000000000000
>  mtvec    0000000000000000
>  mepc     0000000000000000
>  mcause   0000000000000000
>  mtval    0000000000000000
>  mscratch 0000000000000000
>  x0/zero  0000000000000000 x1/ra    ffffffff80c1ac2c x2/sp    ffffffff81e03cf0 x3/gp    ffffffff8201aa68
>  x4/tp    ffffffff81e0e0c0 x5/t0    ffffffff80b91a08 x6/t1    ffffaf80fee00000 x7/t2    0000000200000020
>  x8/s0    ffffffff81e03d50 x9/s1    0000000001000000 x10/a0   0000000000000000 x11/a1   0000000000000000
>  x12/a2   0000000001000000 x13/a3   ffffaf80ffe00000 x14/a4   0000000000000000 x15/a5   ffffaf7f80000000
>  x16/a6   0000000000000002 x17/a7   0000000000000002 x18/s2   ffffaf80fee00000 x19/s3   ffffffff81639170
>  x20/s4   ffffffff820200f8 x21/s5   0000000000000000 x22/s6   0000000000000000 x23/s7   0000000000000000
>  x24/s8   0000000000000000 x25/s9   0000000000000000 x26/s10  0000000000000000 x27/s11  0000000000000000
>  x28/t3   ffffffff80b85110 x29/t4   ffffffff8205d258 x30/t5   ffffffff8205d258 x31/t6   ffffffff8205d2a0
> [  152.312824] riscv_sse_test: FAILED: Failed to wait for event local_software_injected completion on CPU 2
> [  152.317933] riscv_sse_test: FAILED: Received SSE event -65536 on CPU 2 instead of 4
> 
> The following is the assembly context where vcpu crashes, which is the SAVE_GUEST_GPRS macro that runs when it get back to host(vcpu_switch.S: Lkvm_switch_return).
> The sscratch is set to 0(or other bad and low addresses) by mistake, causing a crash when storing the virtual machine context.
> 
>    0xffffffff8004027c <+252>:   csrrw   a0,sscratch,a0
>    0xffffffff80040280 <+256>:   sd      ra,968(a0)
>    0xffffffff80040284 <+260>:   sd      sp,976(a0)
>    0xffffffff80040288 <+264>:   sd      gp,984(a0)
>    0xffffffff8004028c <+268>:   sd      tp,992(a0)
>    0xffffffff80040290 <+272>:   sd      t0,1000(a0)
>    0xffffffff80040294 <+276>:   sd      t1,1008(a0)
> 
> This is a must-occur problem in my environment. As long as an idle VM is running in the background,  run the SSE test in loop on the host, and the vcpu will crash. Can this problem be reproduced in your environment?
> 
> Regards,
> Zhanpeng


