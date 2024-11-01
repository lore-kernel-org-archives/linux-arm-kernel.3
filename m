Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACDDE6F060
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IV7VSQp0iNu5YlXoyBy7tdbxidj67d+a1xRMg7egGx4=; b=lKGlnlAUYhDe4dFW3L62QX1RJQ
	VUlFA/9tCjbGt8NEpJimnRo4L7boxatduCRm84ZPeem6bQDLgr5kAUSoWdrkDO5eAKfN18dkD5fcs
	3tddZnjsE/RkQY9dB3YYvT2gOeS4SJeANXFO/bZ94rcHoIS+TqdtvY8gxulOsh5HzPCEy4pWQm2By
	K/kg8PDeX4FWkQQ9uScouXvQGQO/CYDv8qZqN8dSFjSJsEPfjfBy/voxjok7jgvZW/ZJuv+ILunbk
	7BsQ1EzzH/mSb6XKWeYwCZtk8cgljtmmp+uqWtgrPy3TS0Ht5cb1Hs74tc2D0jmIhk1er7HRTEAWm
	EvwGflLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sTG-00000007Ikb-2G5A;
	Fri, 01 Nov 2024 14:17:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s7G-00000007FOt-2bWW
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Nov 2024 13:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=IV7VSQp0iNu5YlXoyBy7tdbxidj67d+a1xRMg7egGx4=; b=ZpXQASi1lgGdkzu/n3gHk4ZWT5
	GDInVVB+AiBBd3OorNutkNRxbAybAK2eX3tUc3rPHGTwR2Uc2BejQkKXBjgewOxEivWgiD5D3uT6P
	mqBWsSM5SOx2f2ArxJcLJmE9bCxvW1HIpKzU9ztENJ4kRe2NTZGMKq4dnY4/a9VUcJk3w4fh/hGZd
	oTFrHBNJvyM0mDLJvAIaBuG11Vq3Dv/RxzSpoJx/kWeVBrRlYOVb/VPGB/Cew5qOEnN6p5iUQLlcV
	78PD8CrPtDU+zJHigbFP1EClDljuYi2AzgmxQCLwpqKSRoZLN9gyKX58rLIcrG1AzvYsoj4bTpG6m
	WQSSJTAg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s7B-0000000AiFH-3nrk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:55:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9E0405CD054;
	Fri,  1 Nov 2024 11:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97595C4CED4;
	Fri,  1 Nov 2024 11:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730461340;
	bh=TJK4dvAq0cz5a570yGOqBOxxnqLlaSDmkpM6PTTcWBY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ENUWM9t2Lyk0GNAbn7+NOtEzufxSgi09o+n/O83j6np1IJD3Ir7W1cJ1pzYMFQScf
	 HnP51rUltsb2LKa1W062b4R1G0srozLt1zG+paEH7aefdq8R2WQVoFbxm9lQyzmeee
	 I7xrl7eKV3iQiQmLLiqmzsOGiYxuZsRDRbTP3hepUXptoDMTvCoYpUu1fDVxaWY0sP
	 HG7HKbL8OCU5cE4P/oirvxu7DM9uQWToVTs389FgUe92YLCKJrakBz06eQMCdKhdoK
	 NJQgix9I9pWzwoaHFAlD7KHIIVK536Wi4XwP0To0hKIyl+3MLbZJMhCCMt+Hmw/bxw
	 I6upao3711Iig==
Date: Fri, 01 Nov 2024 06:42:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, linux-arm-msm@vger.kernel.org, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 Abhishek Sahu <absahu@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, 
 Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Imran Shaik <quic_imrashai@quicinc.com>, devicetree@vger.kernel.org
In-Reply-To: <20241101-qcs615-mm-clockcontroller-v2-7-d1a4870a4aed@quicinc.com>
References: <20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com>
 <20241101-qcs615-mm-clockcontroller-v2-7-d1a4870a4aed@quicinc.com>
Message-Id: <173046133636.2741841.14625258150070202056.robh@kernel.org>
Subject: Re: [PATCH v2 07/11] dt-bindings: clock: Add Qualcomm QCS615
 Graphics clock controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_135502_179323_E999EA56 
X-CRM114-Status: GOOD (  10.20  )
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


On Fri, 01 Nov 2024 16:08:19 +0530, Taniya Das wrote:
> Add DT bindings for the Graphics clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-gpucc.yaml          | 66 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-gpucc.h      | 39 +++++++++++++
>  2 files changed, 105 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241101-qcs615-mm-clockcontroller-v2-7-d1a4870a4aed@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


