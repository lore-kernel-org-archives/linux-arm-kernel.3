Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9F0D29FA8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 07:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/QayrR3K81EzQnJA2xuLUJ4DfrBk30rvmMwysRQ+sw=; b=cjzZp3ypVaPnI1a5mf/tSqFRJb
	7/fxxelpX8HAxP86R8STXiuGrQQNMXbSpgAFKAXgiMNTlAOwp7ZOFh+YP+FxIHKgy3s4cjtCjA2IA
	SYPKT0cHhpKjl+Ik4+JELjbRDa9X0XTndLeq9DbT57vfL0HFAPL7eWg5lOMjtLfcyff5jJ70kcwHO
	HARMETM0ol9Nqt6ISEyMLCHTqeAHpvDhoJn2X07Poi8JlJszKfl9y+776sk5LWy5jntucmcWoeoYL
	ggcnUsy0CbqUgBxjFqXfPwWs9uPagwIXqMVPTJDOLlCZcyvixVeDcRvYUwSEZDp6+uuaDRZqYwtMZ
	GsEQKxhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aPR-000000026Wd-2vIl;
	Wed, 06 Nov 2024 07:24:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aNi-000000026Cy-3cSI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 07:23:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF7671063;
	Tue,  5 Nov 2024 23:23:39 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA44D3F66E;
	Tue,  5 Nov 2024 23:23:07 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	justin.chen@broadcom.com,
	opendmb@gmail.com,
	kapil.hali@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 0/2] Support for I/O width within ARM SCMI SHMEM
Date: Wed,  6 Nov 2024 07:23:04 +0000
Message-Id: <173087767267.3975373.2771980370736261734.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827182450.3608307-1-florian.fainelli@broadcom.com>
References: <20240827182450.3608307-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_232310_964731_C7913D35 
X-CRM114-Status: GOOD (  10.83  )
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

On Tue, 27 Aug 2024 11:24:48 -0700, Florian Fainelli wrote:
> We just got our hands on hardware that only supports 32-bit access width
> to the SRAM being used. This patch series adds support for the
> 'reg-io-width' property and allows us to specify the exact access width
> that the SRAM supports.
> 
> Changes in v4:
> 
> [...]

(with some trivial rebasing)

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] dt-bindings: sram: Document reg-io-width property
      https://git.kernel.org/sudeep.holla/c/14b2157a9c14
[2/2] firmware: arm_scmi: Support 'reg-io-width' property for shared memory
      https://git.kernel.org/sudeep.holla/c/2cd7f3db25fe

--
Regards,
Sudeep


