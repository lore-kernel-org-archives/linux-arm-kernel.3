Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A608C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8K+15YOUpp/urrn1ei3bbHIw6RB2VLNWq7MiAQhpqc=; b=H9hcLvbTT3lmqK+0I4bKQEz6La
	nd8oXzFn5GOwb6q70MS2aoIcgsbEltHii5QiZMRDvj/x5050EbhOQH7lruIXmahp7/MvGgcunmYT5
	vnVzI5BYiRZKvpd/6iO1SZYncpGYxF70uufRAzyFYhfwHJbA+oSvsthixbsQ2ECKJopugi9N1eTVk
	yMEIWsOhOcDOlkBiN9c/cHEhlGWVvQm6UAMv2OOQCj3c2YdeJivxgx/h0bw6C8FZILNNSngVVPUo1
	msqqa/4URlyhPR7HRGoQjMwcRoXwCvP4k1F5MVPPV9JZiU8mVABfHJe8/r8E7ylc+c9UH14/ncaCN
	nFN1pwkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRik-00000000IXk-09xY;
	Thu, 13 Aug 2026 09:27:30 +0000
Received: from flow-b7-smtp.messagingengine.com ([202.12.124.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRih-00000000IWM-32g0;
	Thu, 13 Aug 2026 09:27:28 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id BCBB013002E3;
	Thu, 13 Aug 2026 05:27:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 13 Aug 2026 05:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786613246; x=
	1786616846; bh=c8K+15YOUpp/urrn1ei3bbHIw6RB2VLNWq7MiAQhpqc=; b=J
	chNOQX7cEmymzrAnkJA7lvWYy1imq69zWuKIU7V8Kk/eTo76f1c03s45OJRKvbui
	R2VskZjmr2BLe0AcOBEQnvlcDD2ViT8fRBOm1WlBOTL2p6jEfPlmNyWS414C4yHk
	iyfoxHkqHNqCue0zm1Lw41EPUGG5h9lJChx+YZ9wJqdjINC+cS1lOgJtQ3pibKOP
	ea5rgROYnBq36uImEwpUb1rbaCwnVB66WSWqSDTe3p3aDKrTjcMNOyGWUAw6ZOFp
	wyBojU6Jnb979ghWWqtN8Lrg0OBYbvyl5MBpOclsoWFpEXHDRHMiIroZ1BR0fvKX
	l6LH43UN88W4zASBXj2jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786613246; x=1786616846; bh=c
	8K+15YOUpp/urrn1ei3bbHIw6RB2VLNWq7MiAQhpqc=; b=jEpgy3wTLbg+/gDI5
	mUdvggjWKy6dyYlYxQGxRMXJRm+2t48ub18tUm0YShpuE6Bx4nen971VB4xEFBEW
	ksB+EOqcEym9p0Vcj43YqHYmWdfwNIx7BBn5WHY0tbiuHtoCRcWs4q+CKpL5+84P
	ibQ2CG90ADyWsH0NmyMHIimYlGu1faJxqRLCZwUWYWhNsPnR05jhN+8vc5vXTJ63
	/NgHYSa151nwHuYKOTbiPuk46j9g2+mQqRyLUOMjB6uI8GKOVkDomXutzohb5SCY
	eKVRiiM2Mt4HXGXZESlun93gkkcABA+Pp6ZlxjQyWwI+JyLZAeyZKbHxNc11HIeV
	Nk+YA==
X-ME-Sender: <xms:_o19atKDrgbiDyHeg4Dq8gSr4IB1dYjlvJ_hJVlhql_XpiTTIUMsTA>
    <xme:_o19aigYuxWhvVLo6jCySzHSQ187dEvsEROWcPAw30KOmfg3c1ybLiA0Nj9dad4I0
    oSXi9yLwxMcPpf9wzdnoBjPvb890VgnTaPW56tk2F8cBmaMaUJZunA>
X-ME-Received: <xmr:_o19auN2PB2eZ01dHarhyxttOujtwYUhFzXwr0CT8lcFi6LQsX_UvwlMsUDhNWAxG5waLz4QpQ>
X-ME-Proxy-Cause: dmFkZTFuCr/cvrFkRUf8ITKF+H2T3+BzZRnX5rHf6gKXH/26Iw/KHABBcdjKQe2rhLwLS5
    TaMb0vpJrni78/UwkRMYpJ9Y7lQ366meAvyCdu0npRBw9/+Ng04388nGiPzu/U5RcyuVkR
    w/TOPVCwMsGrhPKD7nbP8LRzzGM0lbM3SZ8Ad5ojSL3i2CqcoeXL16oisQiBvGK1YuUf6e
    uoh2BP8y5PIY0wC8ImE4FS2TzpbIDM0wVbhBoSSlu3QbvNxjHls85NMxx2CqVfR97FxXk3
    CFEuyzwYAZcFXpoBx7S62xcdOaonv+ExSnsiZJRLGbhC1b6pOSRjs7Svo+R2b3hKW9mKY8
    ff8adf94ky3Th4lwWzeN9rVN55lR5BCN83BH2XboF0N0hZPmGbtSUFymvQ9zOQSbsyWIY/
    VDSff9/Gv2k8R7aiIKcxzGoPdcyKPUC+M8cBRvv+AW4DoQtwpG+SsVojaMPy7fMH/FIPMl
    mZxut+vppC3vo4kSlJSoZydKFkphNdd4tT0rDuKywn9VOAC8GEQVPx/Zwn3hOWuKanX1PH
    xqSJxuTSd2tXlkqtzwj6toj9LsJnGXtnEsfIvn3BKNMmmp5W9VoltkjE598mu+iCaf3XFX
    g4HHN+v62CHSn+Qs6deFpLqNDHGdTqLBwdYYs1lLVuMqbNth2db31JjdXpzw
X-ME-Proxy: <xmx:_o19at4OC3XLjAlWPr4JsaetVpAuO-lO-YS8tr-SF4S1slG89839SQ>
    <xmx:_o19alnOZdx7cPWnK9N8eq_ZFexjF4V8AxzqAxonshU04tsDQWgJ6A>
    <xmx:_o19atKbSmTfla4cszXQQNGEOxmVYe6F_Ti2K1o_nwP5UdwY0UE4Iw>
    <xmx:_o19atSmUDcAgqSYh74X3ZEJHbmjqeroQGjGFhedL5RY7fFathqyBQ>
    <xmx:_o19ak1HWZygJY6_xiu1kRMZibI8SVyxZkx-BTKgTZrxH4wDTjTJxPEe>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 05:27:15 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: diederik@cknow-tech.com
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	tomeu@tomeuvizoso.net,
	royalnet026@gmail.com,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: Re: [PATCH v7 04/10] dt-bindings: iommu: rockchip: allow the RK3576 NPU MMU clock set
Date: Thu, 13 Aug 2026 21:27:11 +1200
Message-ID: <20260813092711.2568595-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DKMWKH7ECZZM.3GL6MUEUO2Q1N@cknow-tech.com>
References: <20260812094106.1391698-1-gahing@gahingwoo.com> <20260812094106.1391698-5-gahing@gahingwoo.com> <DKMWKH7ECZZM.3GL6MUEUO2Q1N@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_022727_813723_E871E3E6 
X-CRM114-Status: UNSURE (   7.66  )
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

Hi Diederik,

You are right, and worse than that, this is the same thing you asked
for on v6 and I told you it was fixed.

My reply then said v7 would carry a compatible of its own and pin each
side with an allOf. It does not. What v7 actually contains is a
minItems of 2 and three descriptions ending in "RK3576 NPU MMUs only",
which is a comment, not a schema, and it leaves both of the cases you
name allowed: an rk3568-iommu with five clocks, and an RK3576 NPU MMU
with two. I do not have an explanation for the gap between what I said
and what I sent, only the fix.

v8 does what you and the bot asked for the first time. The MMU nodes
get their own compatible,

    compatible = "rockchip,rk3576-npu-iommu", "rockchip,rk3568-iommu";

the enum gains it, and an allOf pins both sides so neither can borrow
the other's clock set:

    allOf:
      - if:
          properties:
            compatible:
              contains:
                const: rockchip,rk3576-npu-iommu
        then:
          properties:
            clocks:
              minItems: 5
              maxItems: 5
            clock-names:
              items:
                - const: aclk
                - const: iface
                - const: npu
                - const: aclk_cbuf
                - const: hclk_cbuf
        else:
          properties:
            clocks:
              maxItems: 2
            clock-names:
              maxItems: 2

so every existing devicetree keeps exactly two clocks and only the new
compatible may have five. The ", RK3576 NPU MMUs only" wording goes
away with it, since the schema then says it.

The DTS patch changes with it, since v7's NPU MMU nodes use the plain
rockchip,rk3576-iommu string.

I will not claim it is fixed this time until the patch is in front of
you.

Thanks for catching it twice,
Jiaxing

