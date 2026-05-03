Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5965CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 02:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnVCaxNshzzHjwMMq5W7gN5QUApxgL+R58MdQlfO6d0=; b=ZyBAZuwbMAA1SKEhjY6M/9Ut0D
	yAWLTBWtWnllFB2gC4wJHzCig9r+sEHLOCsQWfleJG7fXJdG9fD7Seo0CSx8ZgmZQ+gP4+HctKTkL
	MGMbuPTGfhITWdIRjWij9qh77ekmRKMOD7dvB4kCuHPGPbiWSV5KFVqxsaEo9ibmWCjziTkmhLRQ8
	EVwAULMxVPKLc8tNlzCb59bHTbogJOV2OmhWIbJND85oFM3/ufu6aEl43397mv1ZCF3EhdN1AbrvX
	HQfVZHEUJixyVbPstr7KyXtt6XCUyWNMlv2J7UpGbL/SORmrf6i+6oWCxX3x4BWPjc+8WP666fu8h
	V4fqZvdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJMEC-0000000A80Q-2E2A;
	Sun, 03 May 2026 02:06:40 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJMEA-0000000A7zV-2Eqe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 02:06:39 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-8b5cda2dab9so13845056d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 May 2026 19:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777773997; x=1778378797; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PnVCaxNshzzHjwMMq5W7gN5QUApxgL+R58MdQlfO6d0=;
        b=F2zF1M+J4Z3Hn2CX3nZIc0EASvHVzyZQqJvBFmiSTZmVJBdO/buz7kdX/W11TbVckG
         GLj8yh9uEks4jpPG6hILO85j3qUzIsf3VuZTwMaHCIi36OIGr4rSmhZWfB1jcX0nAIhI
         xUA+NPhbWbvARrxWsVLddCdYto7gsyctlfecnKZuVuCAI53PwYhO3S8SX6JTelFrv6HC
         1Lp5eyR6khMRk1cfZ4V00sEl3azGHkJvxXvnvaYhbvgURbbzQmnsaKHW7goguWFDb5O/
         oGWO+Tw0Z2NVRFZqvZ6mvJuTsOoOkuNUs7A7B8YOvfe9jx/mTlGO7CIoW2iKGscQQIAF
         xYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777773997; x=1778378797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnVCaxNshzzHjwMMq5W7gN5QUApxgL+R58MdQlfO6d0=;
        b=qRNQPBYtaqX5YolaYRTMT7xvYbu7keeIRs2Mqil1AZQI5YnFw0WEk3fXlk1CcjXvYj
         CF0UXu0KwRv24EULvljYoL9GWKwvNwCKCUapppES/Y/zMgASXoSPBh+GTtbFMMXaK4GQ
         rwIXcVrxzTgpJFpm0sY3g5YK4GNu2gDapEeHCCSY+Xm4oE7avPzxnrLWE+Uq0OC0JN0L
         xnVbKlFWbkTsux9l0S5oP2JxEqjWcud2lsUKeJjb9crLb5IRjQabVkTYKetSvBNHM0ad
         kvqJnBqWRM/5fUgAPQbLxEyxF7vVfPQEZjXSKMN/ePV+rjkrvlspKK5SgYwS8j7S8VYA
         Cjow==
X-Forwarded-Encrypted: i=1; AFNElJ8ossDp+O6QjnZEaaTpeAmnEd+nJE0ATzEoJkww5YdqusoYkWmfc/Wl8oBcSI+Scb4N9w8bkAgz8TW0X5Ibni/H@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf376la8aAhTAJsAXnO8WOuG50kweetHZ4/HIRTE4TmW7pZjCT
	a8obU22wrYhgAv3Cwa4GhZOjQDr0oRATEqZYfl5HcOWCsAMpgbenuOJi3+rT0+dfW2E=
X-Gm-Gg: AeBDieuv6xOM3FxSC13NQrm5f1tFLnGDf3jLxV5orI2ldr9QpoLpPyyZ4CfJ+JOe3Y4
	GgDrdZWZ+E+RHll3rJ9WsAPHL+itNYkhUzE+KPOzDs4tOkaz9JuKZead9icmHFPe+96XBdAVrpk
	q36clWTsHVlYkF0H3nBYN3oN+nt4adbnjv5J2Vva0zpkRPPvWNPtKY5fKcHpKG1O3gSsLlt+x4H
	94XPcz2aYq27kAR3WcOcbidWWJYmrUniFirdAxFJbNqqKSTeoAXepTSeJzfHBEBqaLBLJmSCzJl
	zPd3Yx827n2AWsWq/vKRvDhcq+MNBccbhLPE6z4zzfzKNU4n4t7VXtIHSRx68GDuLhmtUuvJsLJ
	/vSUPENg/rz52M7ocleYiyrXIM1yyfypCXiKpFK7nT+rD2l6KWqbKtPn9n+VgZzcYbYE0vkpDRF
	RdRjs+eyECI5EtgtMo6RtlUGMV5lR9GZ4S95Dx5H67/X23nuWmHQbnKYeaniD8xhHGZdTzzcSvb
	Q==
X-Received: by 2002:a05:6214:610d:b0:89c:8a3c:e34f with SMTP id 6a1803df08f44-8b667b79753mr56665696d6.12.1777773997147;
        Sat, 02 May 2026 19:06:37 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53d831ac7sm72634806d6.49.2026.05.02.19.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 19:06:36 -0700 (PDT)
Message-ID: <649428a4-9505-4a1a-bbbe-bd90be9b8155@riscstar.com>
Date: Sat, 2 May 2026 21:06:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 11/12] misc: tc956x_pci: add TC956x/QPS615
 support
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-12-elder@riscstar.com>
 <20260502094559.15c3f479@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260502094559.15c3f479@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_190638_588974_F8AA44AF 
X-CRM114-Status: GOOD (  10.13  )
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

On 5/2/26 11:45 AM, Jakub Kicinski wrote:
> On Fri,  1 May 2026 10:54:19 -0500 Alex Elder wrote:
>> The Toshiba TC956x is an Ethernet AVB/TSN bridge,  and is
>> essentially a small and highly-specialized SoC.  It implements
>> a number of internal functions, including a GPIO controller,
>> control registers managing internal reset and clock control
>> signals, a PCIe switch and internal endpoint, and mapping
>> hardware that translates between PCIe and internal addressing.
> 
> drivers/misc/tc956x_pci.c:541:17: error: call to undeclared function 'u32_get_bits'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>    541 |         chip->rev_id = u32_get_bits(val, NCID_REV_ID_MASK);
>        |                        ^

Yeah I think I noticed an error like that shows up with 32-bit builds?
In any case we didn't see it during development, and we'll make sure
<linux/bitfield.h> gets included.

Thanks.

					-Alex

