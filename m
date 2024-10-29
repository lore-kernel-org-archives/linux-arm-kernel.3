Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80204D3A66B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 15:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqeRlTfozsVN09UU+kff1ZF8lDSMEDqo8CyqaqZhk/Y=; b=22Jeqhzf6YNzzOimqARNcR7hEq
	anC3ApvEpEsaTJjd478U6/qdLpkLPJ1rVDnm8cUR3qauz6ZVOVhN9E04AEaL7DK8OtbVSefG0LzNK
	4DFphDTAAxo1SC3W8GSYycMLhHME87x6qnXGXstpMgV5rbk8P9jwrcWC/WIQdb4VCCUdTgMxQpTbM
	Yaz3K31Fgr9iFeIYV+r5piDxw40LLsBG8EVHCi/N0jrJPzKwr2jwRNxW1bfJ3wnkZYrbhdtJro+XX
	kFGFAYdPJTw6I4ZMlJHnbTEZfhCIWvuj+WMFAHZfsqa5YFpXMsWP2IVmXaYoHP9anp6kxK5uStYIX
	3cmHYcXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nuO-0000000Er6C-1Jeb;
	Tue, 29 Oct 2024 15:13:24 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nkj-0000000Eo8h-303n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:03:27 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TCVZdE022650;
	Tue, 29 Oct 2024 16:02:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	UqeRlTfozsVN09UU+kff1ZF8lDSMEDqo8CyqaqZhk/Y=; b=hZ3d57IqasGvvdZG
	lWbshJF//k5Qp/RAFozM5AQPJ4Ekhf0hoiwUGjy29Wfkcxg3/vzFmJA+3+P8ZsZa
	9Djk1AvxpBqIY2aVpicVA1gxUHfqIomXXRUgJrJTj8IxmmUeGZ/oKutp3r/3Mxu4
	madaH5mK5nf9oBePt5CvuI58AZYFa4tHNQaqkcsEEn7d644OK9i+rjCXW+h1VE3D
	k5gu7aZOYhyaVdmGgutqS0SzmWRYEYK18VyVPknvc/4vGH1mIpvl0pvo0VZRbN0W
	s5KlL+gO64njEl9kYiNuey/0+eI7N8ugDWqh8Ru7Qtd89cQqqca3afuH86kR40Fk
	zkflvQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42gnj4ff7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 16:02:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7183B4002D;
	Tue, 29 Oct 2024 16:01:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A45E26702B;
	Tue, 29 Oct 2024 16:00:04 +0100 (CET)
Received: from [10.48.86.107] (10.48.86.107) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 29 Oct
 2024 16:00:03 +0100
Message-ID: <aeef0000-2b08-4fd5-b834-0ead5c122223@foss.st.com>
Date: Tue, 29 Oct 2024 16:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] ARM: ioremap: Sync PGDs for VMALLOC shadow
To: Linus Walleij <linus.walleij@linaro.org>
CC: Ard Biesheuvel <ardb@kernel.org>,
        Andrey Ryabinin
	<ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey
 Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        kasan-dev
	<kasan-dev@googlegroups.com>,
        Russell King <linux@armlinux.org.uk>, Kees Cook
	<kees@kernel.org>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Antonio Borneo
	<antonio.borneo@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <stable@vger.kernel.org>
References: <20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org>
 <20241017-arm-kasan-vmalloc-crash-v3-1-d2a34cd5b663@linaro.org>
 <69f71ac8-4ba6-46ed-b2ab-e575dcada47b@foss.st.com>
 <CACRpkdYvgZj1R4gAmzFhf4GmFOxZXhpHVTOio+hVP52OBAJP0A@mail.gmail.com>
 <46336aba-e7dd-49dd-aa1c-c5f765006e3c@foss.st.com>
 <CACRpkdY2=qdY_0GA1gB03yHODPEvxum+4YBjzsXRVnhLaf++6Q@mail.gmail.com>
 <f3856158-10e6-4ee8-b4d5-b7f2fe6d1097@foss.st.com>
 <CACRpkdZa5x6NvUg0kU6F0+HaFhKhVswvK2WaaCSBx3-JCVFcag@mail.gmail.com>
 <CACRpkdYtG3ObRCghte2D0UgeZxkOC6oEUg39uRs+Z0nXiPhUTA@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CACRpkdYtG3ObRCghte2D0UgeZxkOC6oEUg39uRs+Z0nXiPhUTA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.107]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_080326_236206_4320FB0C 
X-CRM114-Status: GOOD (  12.22  )
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

On 10/25/24 22:57, Linus Walleij wrote:
>> What happens if you just
>>
>> git checkout b6506981f880^
>>
>> And build and boot that? It's just running the commit right before the
>> unwinding patch.
> 
> Another thing you can test is to disable vmap:ed stacks and see
> what happens. (General architecture-dependent options uncheck
> "Use a virtually-mapped stack".)

Hi Linus,

I have tested your patches against few kernel versions without 
reproducing the issue.
- b6506981f880^
- v6.6.48
- v6.12-rc4
I didn't touch to CONFIG_VMAP_STACK though.

The main difference from my crash report is my test environment which 
was a downstream one.

So it seems related to ST downstream kernel version based on a v6.6.48.
Even though the backtrace was talking about unwinding and kasan.

I will continue to investigate on my side in the next weeks but I don't 
want to block the patch integration process if I was.

Best regards,

Clément

