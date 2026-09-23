Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D52BC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUM10esT1llVPHZyIHW4iZthuNv9I+jZoCo/FvYnIfs=; b=VrIfIdthP/mhS0lYdFA8JkvNd2
	+lDdHAYa2s0mkqRMN8r4Q4Qf6Z0uIglrY6Zy/L8XZf6hj3+7WFT9Lp2vmjMW52L5qr2oDl5krP4KU
	k6WhuMrxJ1yqSR11VytHgFmndEFCGPKScDIN7zrZ3bJ6ej3OVEUOS30b/E5jZOOr0+0X16bZ6KmNs
	iBiqUIGoWtTku+U50WZdnIePx8ribPDGeHPgdysJsLJTXVdbXUKdkG5cNNxPES4EcmMrwBidcc+J7
	qSLhllY+BLb1QhIFqV3uxX4hnHwycBWp4dIVPOnvsMHc865S6TMcb4D3wgU2eAj/fQLQpeU14Bxxt
	IDtB1A3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9J4v-00000007hYh-3lhG;
	Wed, 23 Sep 2026 09:15:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9J4i-00000007hTy-3Azu
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 09:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Subject
	:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GUM10esT1llVPHZyIHW4iZthuNv9I+jZoCo/FvYnIfs=; b=RiC//z7lBOrBZihyfgPgvrgxC9
	QZ9z6W2LIP0P5OM9rsssnzGiWxKsC81SakkRKZ78KG17o65EoKdbvSNa514tnr4gD4VMa28w0Us0Y
	KC1ikj7tqvUAKGzK51XF/lEcpXRHNOo2vkBuE4B0zDFjCKtf6qIAor24hcRgX/8MtHB/eiiIqF5zT
	7v2DFgA8FXFRHEpZzNE5XI8aDZXKBT79793QyOqRCktbvraBpKaTDG10yUPxhgg4YnoTriLgjWUKP
	6YUZwnTVTKnPuwYmrfFdItjxRiMm8e7fvPAYFxPnhdYI1HLx5JjZiC1fMC7sT55mzKzs8fEd7HVBi
	vgnX0avA==;
Received: from out-22.mta0.migadu.com ([2001:41d0:1004:224b::16] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9J4d-0000000EZOP-3ne5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:15:35 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=oaTRjCWZnQNokZg4Q89meVlVIFu2T26bZQvvNaVlNs8=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790154930; v=1; x=1790759730;
 b=QEbIjIMCnk1sQ73gumwPQOBIS8aq/erpZ2gQABiGdIReV+nKPbhCb1JEfiQJ7Ujljjej5HQA
 Qh4qROVxBBGavLkjo+cwll/ou+ei7uMUPtTZq/TtctQ1Dm+QO3TiYmLVSjJ1jxfaIpetdUpcdcD
 j6tX9sE8sbeUiviKhMoxBaopBJcdAQtgXn0eGXu6VK/BbMF88xrtnY6KJ/6LlX++CNOEqrFoMms
 Uz1dPZVJ+Kd+RjZXz+bnvBOEEk0M7eGW7yVZ/4oUqSaaDSTdjXiARbK6F9wJ4GYmvpS84zx9A2x
 3UqsBTY4qyCyYqbjVNPtTAC8XSXtQM94eMZP+ocw59xXA==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 342944e3381b851a;
	Wed, 23 Sep 2026 09:15:23 +0000
X-Mizu-Trace-ID: 342944e3381b851a
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 11:15:22 +0200
Message-Id: <DLMKYI79QQRS.28Q4ESQ974BU@cknow-tech.com>
Cc: "Tomeu Vizoso" <tomeu@tomeuvizoso.net>, "Oded Gabbay"
 <ogabbay@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Jeff Hugo" <jeff.hugo@oss.qualcomm.com>, "Robert Foss" <rfoss@kernel.org>,
 "Sidong Yang" <sidong.yang@furiosa.ai>, "Diederik de Haas"
 <diederik@cknow-tech.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Jiaxing Hu" <gahing@gahingwoo.com>,
 "Nicolas Dufresne" <nicolas@ndufresne.ca>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Guangshuo Li" <lgs201920130244@gmail.com>,
 =?utf-8?q?H=C3=BCseyin_BIYIK?= <boogiepop@gmx.com>,
 <dri-devel@lists.freedesktop.org>, <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/11] dt-bindings: npu: rockchip: allow DVFS and
 thermal properties
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Igor Paunovic" <royalnet026@gmail.com>, "Rob Herring" <robh@kernel.org>
X-Mailer: aerc 0.22.0-24-g39041fd9f179
References: <20260922080114.44662-1-royalnet026@gmail.com>
 <20260922080114.44662-7-royalnet026@gmail.com>
 <20260922160602.GA3529337-robh@kernel.org>
 <20260923085755.16219-1-royalnet026@gmail.com>
In-Reply-To: <20260923085755.16219-1-royalnet026@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_101533_716810_B0033A3F 
X-CRM114-Status: UNSURE (   7.06  )
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

On Wed Sep 23, 2026 at 10:57 AM CEST, Igor Paunovic wrote:
> On Tue, Sep 22, 2026 at 11:06:02AM -0500, Rob Herring wrote:
>> On Tue, Sep 22, 2026 at 10:01:09AM +0200, Igor Paunovic wrote:
>> > Assisted-by: LLM checkpatch dt_binding_check
>>
>> Drop 'dt_binding_check'. That's expected/assumed.
>
> Will do in v3. By the same reasoning I will drop 'dtbs_check' from the
> two DTS patches, 07/11 and 11/11.

Doesn't the same apply to 'checkpatch' as well?

Cheers,
  Diederik



