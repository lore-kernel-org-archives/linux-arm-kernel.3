Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCD3E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 10:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IfSOIY3P+vCrp92lvm5n+EMTimI0ySjpcZsx2xNiU8g=; b=0v1GKNTI99xkRvOb9Cdf93RgZn
	uJr8Bhg6mUSTcpuznMDFtbnV9ecXdy6+G9r0OFJqa+aypGbfDTXeHenqNLDEDouevliwE7IkmEZhe
	Xj32XTJQSW033Un5xcuqUwbCfya8T37KiH/A/TM6MvJSE+JdCg8j0ZN6gEn2xHNM/CafkZozFccpn
	W6KAKqo9bAXQmJYp8QJ+D6+ffqhj0ZIn+jAnQYiAzeeF3HyuBYPmWgMKZi3o+3cU5Uve+za5yAqUb
	3edWYMU0T6OwduR8d4tRjwl82BV7vcVogCe4c98f4AYC8/HfzuM5/XZPBmUEYPBRovcGcYN+wRML4
	9vkqLpfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJuS-0000000EZYB-2hwH;
	Wed, 11 Dec 2024 10:25:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJpv-0000000EYhh-00K6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 10:20:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78E5E1063;
	Wed, 11 Dec 2024 02:21:22 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 81D223F720;
	Wed, 11 Dec 2024 02:20:52 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 0/3] coresight: Add static trace id support
Date: Wed, 11 Dec 2024 10:20:47 +0000
Message-Id: <173391229097.561442.14812407436677697542.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121062829.11571-1-quic_jinlmao@quicinc.com>
References: <20241121062829.11571-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_022055_081735_15E7AF4F 
X-CRM114-Status: UNSURE (   9.39  )
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

On Thu, 21 Nov 2024 14:28:26 +0800, Mao Jinlong wrote:
> Some HW has static trace id which cannot be changed via
> software programming. For this case, configure the trace id
> in device tree with "arm,static-trace-id = <xxx>", and
> call coresight_trace_id_get_static_system_id with the trace id value
> in device probe function. The id will be reserved for the HW
> all the time if the device is probed.
> 
> [...]

Applied, with minor fixups. thanks!

[1/3] dt-bindings: arm: Add arm,static-trace-id for coresight dummy source
      https://git.kernel.org/coresight/c/d0a10da78cbfabcbc2eda87ac238bc03bb2b2c81
[2/3] coresight: Add support to get static id for system trace sources
      https://git.kernel.org/coresight/c/fd9b7e8e9fbc23d69fa4accc881dea2cf13a2e2e
[3/3] coresight: dummy: Add static trace id support for dummy source
      https://git.kernel.org/coresight/c/f7d7454607cf863cc860e201636117e242d45fe0

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

