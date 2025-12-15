Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7810D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 08:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i19oqqoXVaKiueHhffpmT8LEGcvD48MMdVP2HUweg+U=; b=HgQ6Obwpvv2ZWcVqlwevuah5da
	IPbMI43z82jRTH3z8g6nx4lWDnGELwJl1uy7LKQz1UWQOaOMOY4M8sxLJFsQMTpcA/qnoUxDgnkP7
	cf/D1+hvBG5qxn4RVFR2mFpeev2OmvHA57oIG27wGss5QIzOS9S/UOo0+b5xcHEzTkATp0FTBw0kf
	zczbv51xDdOFxhXUAcaDiqpSYXSQC9ovBdZdH8lHFdLGz/DAzrr2VO5GDLOH0s1z0LFkY7FaWMunX
	k3rx+zsIo2JM73m5k6QVQnHofj1KpEfdEYzXWVhEXzj9lIgT7uI5uA0IDVAg8oW5qJaVuufK6Moie
	3VtNtF9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV46l-00000003HS2-0fSy;
	Mon, 15 Dec 2025 08:39:07 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV46i-00000003HRa-0MZ1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 08:39:05 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5958232f806so3711289e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 00:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765787941; x=1766392741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i19oqqoXVaKiueHhffpmT8LEGcvD48MMdVP2HUweg+U=;
        b=GuvSZSJzcoL/W5trEJ9Nc2CftuneJpeEOdDzbhtOE5tlif3kbWpjtVxTLFS+Gm+o78
         OBb5m63b1TDNSzYsYwGW6R3YesqOymMJwrz0BNCJ+X1c/bsFWrasBBNiYksl0CZCsT/i
         o6giG/HRKcPEZCKAF6PGDamtrFev5MrPPpU0Ern9sNyRDL/xxWxtTOejSLvQFnpIUnhQ
         NiRvls8N2VHFM/wI5ez/TLcaSU8BIfFlBsgAGXqcs7RC5jrYYxlfWWEmJCWunWy2yM5S
         6SXyakd+STTTRX30Y1b/xddwp0Gi1dEitTC4uQ6yKnBNNkvMkA6J6Hi/E55eqVyLOuSG
         DO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765787941; x=1766392741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i19oqqoXVaKiueHhffpmT8LEGcvD48MMdVP2HUweg+U=;
        b=Qc7/kgWHI63YTicK3sIphon2YzZfUYMOagkN7e+OvD+97cJ/oFg4u/4r7RR7AD9WYZ
         UK7g4hPyOrROLixDQhYP6lQaWb0cvAYLagwfqGarx2J1SBTz41KQkihYAfbKo0S3Bz6A
         MXnMX/JJAZ9Rkn8mTnFOhiyv/xLDutbeojN/KSNCx7z81DBXqlLHoXxLK58tIbBgbWFH
         BvgNyZ78Z9YeZEe0YgJAX0TwHhFm1ezSU4OBIVVRoQXXeiKs+YlbDUO45N/8//jGvVOB
         DHEzwJGVo1ygUhHJOcu5n7nvxdCy8XKWgoBP0+ijU/IFMaCQVLicN2aZQlL7/H+FQFf1
         TRtA==
X-Forwarded-Encrypted: i=1; AJvYcCWjuf/yUoZsT/PxnARRexz9VDbOM9u8bX7vXVgcSzn9dNR2nt3R6raYyy8YarH+3Y3fx2mwfktAEkL1drupDF3b@lists.infradead.org
X-Gm-Message-State: AOJu0YztZ7mFQ7MCRNPhJSQhYgQ7xi3W7fZ+v46/cXJkQYOopWtua46Z
	uzHfNUHKHvHtmwPgLgyGdLO4r2A/olS4vOXlEVLYtOgSKmVfZ4RVi5n5bpkcDTqq9hw1KSWamFo
	5mf/uODRwKJovpwwIwYRpXGWDuTSUE0fm5Cz4DPMP4g==
X-Gm-Gg: AY/fxX6Wq0bO7X3yV70DKqzUn+QJee30KeNImFMFQgiohDq2S6pr+RFybF55DlaGFyM
	IsdEXedfHD64ecevOprBSLl7w5B0vSQQx2S8r7scyG4oZnTqRNU9mciFS6SUXMyrc0t+dGznIO/
	+bunzKQLbW6iqoVD68QpTK3VNHe8eC/+US04JClScNDg6q3YFJYL6v7VvfEjAVOKhrQE+Egh/GS
	JeKT3mMhxmVGNI5H1J4Evgr6TNAXLwSaQ5ghxceuFdQFLbyohRBqnTtq4Rh8D/yk4yg3LRDTvOq
	jQzEv3POluf3EXSJH2NNtUSwpV7D
X-Google-Smtp-Source: AGHT+IGJBzsAjLlf1Vh9ubvyyFYK6DVpOMTrv0wQaOEdYLII8tMyop+G1+WfxDHV8I6tPfsyEfUipqIgdB3131fb1Yc=
X-Received: by 2002:a05:6512:31ce:b0:595:7f64:fb7b with SMTP id
 2adb3069b0e04-598faa075bdmr3558262e87.16.1765787941087; Mon, 15 Dec 2025
 00:39:01 -0800 (PST)
MIME-Version: 1.0
References: <20251104103942.96647-1-marco.crivellari@suse.com> <7e44d434-faf2-4f14-9427-9e6173912d15@amd.com>
In-Reply-To: <7e44d434-faf2-4f14-9427-9e6173912d15@amd.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 15 Dec 2025 09:38:49 +0100
X-Gm-Features: AQt7F2pPYrVTUjZsmlVeJ_8LCNt2j7jDIWqNu0H_SIk2t1qfslAJyTZDoqW7d_0
Message-ID: <CAAofZF6X8HSkJnK3UEoP9M1yN52XRy+U=Dh7YWGvbtxYqvsD5A@mail.gmail.com>
Subject: Re: [PATCH] soc/xilinx: replace use of system_unbound_wq with system_dfl_wq
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_003904_130791_ADE9A635 
X-CRM114-Status: UNSURE (   5.87  )
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

On Mon, Dec 15, 2025 at 8:47=E2=80=AFAM Michal Simek <michal.simek@amd.com>=
 wrote:
> Applied.

Many thanks!



--=20

Marco Crivellari

L3 Support Engineer

