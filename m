Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4F7C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 08:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHBf9KIGX9skQDUPGn9m/eAuRafYFNCwT7CcfK1pNpg=; b=iQG1VvhlZC9qX+vKYiL3ZrP64G
	Ag8rKfiExzfX7l6/HG2+PSbgVnikBt7WPTPpqef8zmnLOIFRLdK1uk8YdrRIDWKKN6HVi/h2g/CFD
	GPOVVj//BNUs7F+Gb7ElFpiAcZ7J4dZC/dJbebiVEEY7AjwEEtqqxaH2STSNain7/zepDbNPbwN0Q
	G3ix8tvi0PIMZ5Scf42uccKTwI2FXli8eKAHzlG5aJfYY3xsEQQl0Lk7ZsmMPoa+KwuqiVM+Xxojo
	0zuYYZYHzJxug28ON6GVajA9HPCIcXC34NxP9DwH1PuJbD6SnOvUba6qdSIwojWwx26b2Sy3um93u
	fu2wGcng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbKA-00000004ZPI-23YY;
	Tue, 15 Jul 2025 08:47:42 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaqE-00000004UMN-3W8z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 08:16:48 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F6eaSF008220;
	Tue, 15 Jul 2025 10:16:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	dHBf9KIGX9skQDUPGn9m/eAuRafYFNCwT7CcfK1pNpg=; b=GzTnNJo9R2dr9qiG
	dXXiL4QKZ5+6RSkjo1J8110/xGhbC42nGIM+nV0B/3cGYN7BAkzsojekd+W9uNTk
	+CH4862GDkMuP+CJbxswzyFD0F10lPWJ6C9Eyg5hO5TF/4Z3q/VaD0n76ysw5a5v
	2egIirYzKTaXMHZYd3nThIRuw6t/K09U6ghuPPDrW/u5VtfP5+deRJwnrRSR/3sc
	+arH37hRWeez5SfHYQmKmVStYraZaZZcgp8UexB3BJtHpeV6okWlDTywcebeukKi
	rPBmN46kal7qXgHKxnEuHYcT9em4aWlXZSJtU5WoXHBGq9zCzXe0Bo8D6DPdZhV+
	9nl/qQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47v2nnrvj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 10:16:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9CC8040054;
	Tue, 15 Jul 2025 10:15:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F185EB60F4A;
	Tue, 15 Jul 2025 10:13:54 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 10:13:54 +0200
Message-ID: <7f363c87-01d5-43f7-a15b-844fb5530c5d@foss.st.com>
Date: Tue, 15 Jul 2025 10:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] dt-bindings: pinctrl: stm32: Introduce HDP
To: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antonio Borneo
	<antonio.borneo@foss.st.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
 <20250711-hdp-upstream-v7-1-faeecf7aaee1@foss.st.com>
 <11a49801-d187-479b-865b-810ca5adbf00@foss.st.com>
 <CACRpkdYXQRGO7BrF9+08StWyOkDoqLhNQdgk=bhoccg1BogpqQ@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CACRpkdYXQRGO7BrF9+08StWyOkDoqLhNQdgk=bhoccg1BogpqQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_011647_141118_5C23DEB0 
X-CRM114-Status: UNSURE (   6.12  )
X-CRM114-Notice: Please train this message.
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

Hi Linus,

On 7/11/25 20:51, Linus Walleij wrote:
> On Fri, Jul 11, 2025 at 10:04 AM Clement LE GOFFIC
> <clement.legoffic@foss.st.com> wrote:
> 
>>> +maintainers:
>>> +  - Clément LE GOFFIC <clement.legoffic@foss.st.com>
>>
>> Oops, need to change the mail address here too.
> 
> Don't worry I fixed it while applying the patch.

Cool thank you :-) !

Best regards,
Clément

