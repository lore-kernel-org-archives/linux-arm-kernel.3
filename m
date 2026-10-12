Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B44FCA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 20:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HS3YiJJwuBFYmXT0xY3bh6dZ6ZY38Ujwfz/IeJXETc0=; b=r8NPVGSb4dUAEyfiyMp2KOxAGd
	QHOg1gJR7UJ1f45FzqfuCrcY10OwwcVObbgP9yQjFSxK37rr82l9cnWDA0v4KCQteWWY2xufvbkZt
	9wMyqf4E73ubL855N0cbNB8xUdbOb3SD+qXv38FkTRzo7gwnr7YOSdNCeSoe6LL/EPr71uqIE+MZY
	eqJEATvd+bXdXQk9JPlmh7ipSsetwn9QiGickq9x/86I8aiO5iUAQdzF0uG1nad60M1kgSvIvMd5d
	3w19qo3qwXMFiI/kCbAjQtgw6OwLnRRQ3guXfCy0lHhWc7o9lAPEqrWYDFTyGOYIEYWdXzKEr3Hv0
	/A6aeFmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGMQN-0000000BS4k-07UJ;
	Mon, 12 Oct 2026 20:15:07 +0000
Received: from mail-ej2-x09.google.com ([2a00:1450:4864:34::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGMQJ-0000000BS2a-2YzC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 20:15:05 +0000
Received: by mail-ej2-x09.google.com with SMTP id a640c23a62f3a-c2e36c7fc5dso120805266b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 13:15:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791836101; cv=none;
        d=google.com; s=arc-20260327;
        b=hI6caJlcqV2PDdyb8pQBtejSEbWZ6mu+hUTp2xiwJfhWzUON8rKmzQ72LJ+x1R+BcE
         V/PXLz9sYWzjxXIl9SyQ1RqUPCQJsmrj3oYJ02mmw7GBQsw6I343QO5Lx/exHq+l3H3J
         AbPTUVsyaFuSqyzXjzG+JdFEBkgQlw9uPnQjoCJsAh5ZwG2UboB71O7aSf68UNeU5e1w
         XeJrTc6NPG/FVWEm0+IGS4BxjD2n5KQwkA85hDOSbpVZAq1W7as94bH8268tds1/sHxs
         gv9DPl507KZrMKTdmFQG+RglkjCj5JwhWVWe+pLFQOPWfrlV470RHp0YxcwC7HzYhtl5
         dgbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HS3YiJJwuBFYmXT0xY3bh6dZ6ZY38Ujwfz/IeJXETc0=;
        fh=rP+sNpYVRzCjW8JsJVorwcoKuBFrh9LdduITRkefpqk=;
        b=kLv8sDSk473PSboWWufUQkm0fX8ETWrkEMt4Hu355PmmQYJYya/RayNngSKdYthM2R
         PlI2yRT6AYc+89y+PNxUjFLYba7OEuFGE4sOL6O4BhMC2l9WQFILJVe/UKtdLEf7zQt6
         cmVnwGfdrKl3gFaedO4UBRaAtqO7FgFrl0uYfiqff5Lrj3uZlT78Zn4/X1T4124jGtL1
         2PjfX66Hl9DkjGXfF+4YKuWWAik31F6L29nErM57+btVZvJ4lxxryuEw8csxTeWOd0+1
         tiqVI9eia81Jy5BxeZNifOhNEBsWlW0CXgxzLBCOp+T2YgL/n3VPS98NxBNZ+ah0DQFs
         y1Zw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791836101; x=1792440901; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HS3YiJJwuBFYmXT0xY3bh6dZ6ZY38Ujwfz/IeJXETc0=;
        b=QoXd5cUt/UCkl4kLksu/rlF81HaiG+MMMIpRb9zsDTvJ0jmiMJHnppOiZsUxEaG1r2
         HFZMxRMP7MEraoDk4Aw6FHai8Pr7szsj1vdAeTd7yUOiHrNfAIMgUBvMQ3baR+EyjX24
         NPwHnvdZe/N0CQIRGyiqVwqT06z+q86ucvu5ariJGH7fMv6iW/REkAzUpRzG6l2O+ttd
         d2ib416+SSRnfpaxhJQ+vYWc5h7DQGjO8ZEV/9xhNQUx6F0e/+gFatGQ9wQNK/CyaJke
         ng/GrAITQViEE99tGM5j7METo9FAZM28jKwW/UKiInSRn5JSo6GtKIZuaKHg0sZA8kVB
         lqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791836101; x=1792440901;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HS3YiJJwuBFYmXT0xY3bh6dZ6ZY38Ujwfz/IeJXETc0=;
        b=O1Y922pC/QfVFb8C7W7XE2zGxxY3mw8v5izrVMJTX5OxNEKvpLhLmjTV2ilFF051Ci
         jooeOKUkedRbH6HbawfY1UuSgMYtZ0a1msNO0ZelME+YOhXaGvk+qxOE57SfoaIkR/cM
         Kyyq3GD/q7mjn7qz2NnVF80ax/t5Scc52q+GUzK/AgB9pYK2jPNvksLUGgN4tAT02pED
         ZCNJ8fNMAsq/y4OlY6a5eJ8lZLSpuBH7crfl3IisRmWoH3AbiGYKdGZazscFtPyuepq4
         CEcDINkXZfs27/HqEVymON9pEs/kdxr7FR0XfxUIPLkKCyhxNMsZ7IlXu6LxU+qvp37D
         pjKg==
X-Forwarded-Encrypted: i=1; AKwUvByv9nyp/nTpSqSb2oaHoTVJiAc0fcZYpKgjvat0JOaphLj3p/pvFIUaXKqovSuQBJxNWsFqdf8+aoTs+wD06qvL@lists.infradead.org
X-Gm-Message-State: AFq9FYKwutE6pzrhl+XGT2gkNw3TGkCSTT4rDShjGnPU1g7xICBT/+ho
	03UoTe+NiBQvI+4uNiTS9dLfWJWnrv74XktlrgTLEY1V4Ozw+5KzfQ3ew4SIowffeUMZAP6UJve
	L6mAFc59DLqvGRdhlLfDTFugvDye9B10=
X-Gm-Gg: AYBFou0A7MxyWmp9Vw3vD+IyV2qNnEwuvvZkuF9DQS0KCJMdm/d0+SHTFtb8PLopmuA
	OxxFBRe3lD39lh01rxy3HwaOFL9jTSMyj53/IBQLkILRO0nlc+SBgdf+yuaxDbkdCMRAnCWYuoi
	e4Rbw/hOH+/dczxFmwN5zy8mKLr1qENHi1aA+FRqVpJkALM8o9pIVIYROCC1oW6eT4V6kSGqs80
	9nPM/Btly5dnX0qeuie97cntqfhOCuaEJ5JXghioEd1YQtZ0B5wm4KwOyE/u8aeeGnOa0795VAP
	buV8yIlexdin9NgKIreCLN8Evpl93pU6d+4IYk1VvwSLTwMhLqvhgexygNA=
X-Received: by 2002:a17:907:9712:b0:c2e:808a:f781 with SMTP id
 a640c23a62f3a-c31a9f8bc7cmr977286166b.34.1791836101394; Mon, 12 Oct 2026
 13:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20261006162807.2843858-1-coiaprant@gmail.com> <20261006162807.2843858-3-coiaprant@gmail.com>
 <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com> <CALj3r0gQ_U2ZUJkRgF4NdB1Gd3A8ZT3T6qjLhwGZPg=VUXLsrQ@mail.gmail.com>
In-Reply-To: <CALj3r0gQ_U2ZUJkRgF4NdB1Gd3A8ZT3T6qjLhwGZPg=VUXLsrQ@mail.gmail.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 13 Oct 2026 04:14:52 +0800
X-Gm-Features: AclHuK9DIbMdxghdp8dVnDg3M3UkCfAC1pjnUxZw0sP50Y9CDUKz7Qi3PzTsHZE
Message-ID: <CALj3r0hSyVpn4Upbun4DOk5hdOH+fzEFG2E3LpfvS2YUXH8twA@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: Vinod Koul <vkoul@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_131503_703887_96C0D25F 
X-CRM114-Status: UNSURE (   8.31  )
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

Hi Vinod,

Gentle ping on this series. It was sent on Oct 6 and carries Conor's
Acked-by on the binding.

Is there anything you'd like changed, or is it just queued?

Thanks,
Coia

