Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42310EC1128
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 20:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RiWFdzZ1ByQzbG2KE2kCdU1JalmzDB+tm4rJmyUakEk=; b=echZGD8BpxU3jz8JjEjiHW6eKz
	LGufUjbtuTKN9kfMDn3mdw3RE3yNbH3VMCGYI9JpG7r2n8FshlyVDtQI40DCmDklupdPSiZI90hvc
	NSqgxr821FqDn5NadOh/CMkgh5rpZjKtCNPlCmHmodM6S6RaViAJeBAWTOE9K1wvxJlIQFC5m9xQz
	HRRFHGJoFMiNeX0xRVt+Enf4PVatXKF9HhWx8ncu9Y658rnQ+w7ILze4zpDvLc3RfsI43fbULIdN3
	AO9CQiaaYUEB6WdkhWSspy8GS7rqGHaXYWRsRoowQBpQ/dX6mSkHFJ3Uu+pmrrBK4Xy/feuGENE5z
	EScfdyJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuc9d-00000000yar-49ij;
	Mon, 23 Feb 2026 20:03:41 +0000
Received: from [95.181.193.9] (helo=mail.auroraos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuc9a-00000000yZA-2zwD;
	Mon, 23 Feb 2026 20:03:40 +0000
Received: from [192.168.2.104] (213.87.162.218) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 23 Feb
 2026 23:03:33 +0300
Message-ID: <ecf6e7c5-31a7-4e43-8ec9-c6afb0122e03@auroraos.dev>
Date: Mon, 23 Feb 2026 23:03:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: rockchip: use *enum* properly in
 rockchip_pinconf_pull_valid()
To: Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	<linux-gpio@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
CC: <linux-arm-kernel@lists.infradead.org>
References: <20260223194424.19251-1-s.shtylyov@auroraos.dev>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
In-Reply-To: <20260223194424.19251-1-s.shtylyov@auroraos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.162.218]
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_120338_753521_9F92F77E 
X-CRM114-Status: UNSURE (   6.31  )
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

On 2/23/26 10:44 PM, Sergey Shtylyov wrote:

> In rockchip_pinconf_pull_valid(), the pull parameter has *enum* type that
> is not isomorphic with boolean type but it's used as a boolean expression
> in the ?: operator.  Compare pull with PIN_CONFIG_BIAS_BUS_HOLD instead,
> dropping the unnecessary ?: operator as well...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
[...]

   Forgot to add that the patch wass against the for-next branch of Linus W.'s
linux-pinctrl.git repo.

MBR, Sergey


