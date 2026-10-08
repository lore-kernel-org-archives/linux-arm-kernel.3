Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EE4CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 13:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZUbMxUpxX0Lqzuy2UJBKxnXi5XYr9NHRVpDorwgq/o=; b=vxlHRkXCM2nyGp2eCk99nhxvXs
	Hbxo1f6Dt2cKUli37YQZ+T2TcseyF/75lq/7qps/yFxUctJe2hy6swIPitHRco9pgv9+zn7rcY8Oj
	QMhTqX/UO8b9GVB2C4nX1Xcim4KzuYuIKd+HXo26l5vV9PLwYKQeGJ7tQBy04V5GfJGXcqMrSkJT2
	Mo8VFJCq7C0R9QraCat55ereWYwskJfKg1rrpZU13f2PAUWsIob7kK6GGWk7TLeAgP0d/mJ7eUPpO
	ChguzRoJb16ydQAlmwZXSyAgk4nV2PtHu25+ScorKQF7OvCsK2XRVwbXO/4tVWCqHZZdJldNVFGkV
	na7HOMfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnuY-00000004Q30-0ESr;
	Thu, 08 Oct 2026 13:11:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnuW-00000004Q2q-3VPv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 13:11:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AAEE413A5
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Oct 2026 13:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1C71F000FF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Oct 2026 13:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791465108;
	bh=3ZUbMxUpxX0Lqzuy2UJBKxnXi5XYr9NHRVpDorwgq/o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Gc+Q4XJWclPhlbaRpo2R+ExSrEtVW6wPROlsQ4Bi7an43X87dFa3DxQ7hrqnJaPTn
	 Scn6QJ6eiOQIPr9d7Ecs/ta+OfQAIte5ICHNa7Bd1g/v4cLQPuT7ZumWBXX36Qn8sN
	 epRzgHjpC4afw3b7iGZckjkCPZL7yrkHgxcFz8fQnuhXlf6zbRY/+5HQGMwBFCHBlp
	 2OgnR1f02p7wfnu1/v6U277lnEJzxlZsUTp+Rtuxi83RlgtNB+vqMM5DKTLtbx/4GK
	 2mKj/S2Z09VDFEJKqBxv8rmmuJYtonS74KaPkhEK3TpxVS6z3aAIJ+Ut9JryjYQu0R
	 LIJNTAqfvAggA==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4932b13c4ccso2653814fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 06:11:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByfR8GySjpi4ykY12zbTJPa6mLpZGW6KCUMn04TQrnmr6iY8p/ZfzZrqLp5uPdoGv2DNveVnUI6DKWrfgrs2jVI@lists.infradead.org
X-Gm-Message-State: AFuF++lfzNw3KOlV69vmsKyOWzRM4dV4K/oijUPF0Ka5WO8LKnU1yTFI
	QMnK+zbEYyFGt+dQutG2dYAGweSYtPVRVhucWjqwNDzLRIGgXdY08UXnOFM/KuB9+SYBMGgkwRd
	I8j2gy2Tg5QS8Sw9wqDk1AARdpz3b9zs=
X-Received: by 2002:a05:6871:e494:b0:447:1ceb:7cc6 with SMTP id
 586e51a60fabf-4a25941a610mr4860389fac.15.1791465107628; Thu, 08 Oct 2026
 06:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com> <5555b1ee-1355-429f-b3de-f0926e4c30d6@oss.qualcomm.com>
In-Reply-To: <5555b1ee-1355-429f-b3de-f0926e4c30d6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 8 Oct 2026 15:11:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLkPeEQN07Qk9RrmxkRf5EbMmnuwdq2yBFccwM_QpvjsLw@mail.gmail.com>
X-Gm-Features: AclHuK9XbU-gzMmBKDUbW7UPuP5oQ_ICgGoyJeEiFkqnZtp9niPEqb7SccXKcXU
Message-ID: <CAD++jLkPeEQN07Qk9RrmxkRf5EbMmnuwdq2yBFccwM_QpvjsLw@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] Add initial support for Qualcomm Kuno SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Oct 8, 2026 at 5:12=E2=80=AFAM Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> wrote:

> Hello All,
>
> Both of the following patches are ready to be picked:
>
> [PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2 address and
> size cells
> [PATCH v7 2/2] ARM: dts: qcom: Add initial device tree for Kuno SoC
>
> Could you please pick them ?

Missing from the To: header of your mail: Bartosz, who actually maintains
Qualcomm pin control.

This is likely why it has not been picked.

Yours,
Linus Walleij

