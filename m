Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592DBD2ECE6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 21:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYt6AqzlDCpX/kL4Ld5TnPmJOih6jU/LzjugOjIWs5w=; b=fwADCHZ9T0BXsW3KkbzW++JI7u
	hwzTr8ZsFS73IBINqUs+WH+qtYc9f9cRK6mnyX5s7XHnwf7kO3zYrA4qu41jCDhcnCCFxKaiP/HUT
	quGbUlFT16lpEcIZCu+9CHJXuLqLkPvS+HADNsRFqB27PhPWPhOWmCPEJTb7YBkBkzhO3lmgAPcI/
	80/xLxKifFc1zhYmC/B35fWUXkrLLYdQ/hnh1Z0yiUaoG4Vn3l8FBte35AjjhBBPxkU/MKjPtnYNU
	Xthy5OkPkE/6WOg0dVISdLcF+oW8+vNeWmEA/oIIRVbZYcRdPoCqpCsOv5tJFnQXZxMdCakW9mxmv
	H68YNQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwsN-00000002u53-47pi;
	Mon, 19 Jan 2026 21:33:31 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwsL-00000002u49-3WxO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 21:33:30 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a09d981507so35660015ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 13:33:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768858409; cv=none;
        d=google.com; s=arc-20240605;
        b=aUErRxV1CbFgUzTDQnZwdvJsqrAsTB1s+YuXsWA20I+JvbDvP6Wzp0jBYopvyLVy2i
         eut+H33njUM/2LD5WHjySx7e4551VLRKz62W+ErUQDdby0J4/i/lh1SPXLzgF2GDHlsC
         LqYQhKM9s8bhXFp7k9CFh1tglOUTh/uVWMA2HArR5iMHmbZH56D/hI+OJKH6LAec/YyR
         mQ2wa3lXDExOlcwftVVT6+EpdzHGQBplIgJUpqqBHsW/ug7ijbQ8BktPJLe5woXOljQd
         geRKyxgyeSqOAeeJQLMfKT89U8BrMgycjjeauk9s7986ZU/759c9ldU6Bb10SVwJpK76
         5+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WYt6AqzlDCpX/kL4Ld5TnPmJOih6jU/LzjugOjIWs5w=;
        fh=zE6itO+mLjJ112ODp+7WKLsTECFSzOEFp4JDug3X3/c=;
        b=cyy5ujPFH71YpVDXLVfUosdGtI6AXkg3EztMZzGlAg9yFFFORkrz7Ky2aKHCt+VOSi
         qRi/cvYCuJTgB63DYDfDZBSzkQ+eRraOaWHJHB16F8ICTipmkxsioGgVOptpbvIpkjRV
         7X76aXC6BdtZOF4l7sK2snfzqLgS0DMN2f7qKOIUWCmult0n0InQSC659NsyQG7gHZVl
         IlNEzBTghAOVX017V2nFe+I7il6XUX4JbIUCcwJhZIGlCm8JiKdRug/VYc8BLe/Zslhw
         OgSgphnxhH3LObaX1AAfIVk3pwy7AJCHCZyy/C/bitMlX+Be7ruK2FpQLXlLrgwYeGgb
         1dBg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768858409; x=1769463209; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYt6AqzlDCpX/kL4Ld5TnPmJOih6jU/LzjugOjIWs5w=;
        b=BNVIAX8gnjjFdsKu6le6zv+wtZSLrlEXxVMeHbNyWXTAuVcEG4IOQEGaXntyjWbcoI
         BJFfmMtwXoHnyOx48+xjYQ/inWQoIo+9jWmAsyXJEvUQICPZ74kZGRHHvLHTejxmUrqa
         v9qsSGEIwHvZC76jpwhB7iqQ72rNoDPboBDHjSZPTCUp94MTRov6rz3bwYfdVG+4rz5H
         OiC+1AEVD2cAJ2WxbILzQiklme4glxzTfAZY7fS/mhpmwXDMgCJLyAvsV/MuZQPDQZmA
         HC/76kjCh0XfvbeBn+Avm1IKxpE7hk9yn1S8v1Qi8/VWX1n8DUx++yS7DdPS9ZT5mo01
         FFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768858409; x=1769463209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WYt6AqzlDCpX/kL4Ld5TnPmJOih6jU/LzjugOjIWs5w=;
        b=fmCxumUrqNuOqNuwcP/XrNJorspPisCXfBFAP4/7ocXjTN2SsOBhkmzeEv/X3Pvcj8
         5/2DdorHxdfZiuewspmOEHy1FiHNVd4sZqMF8ML5dfhGXlCzt9EM9IETQ3k3HNVJuBBA
         zvmCvJ1csBmNaJOc4mVPIi5hTzBq1kgvqzV8L5JkPPMtdRa1g4BHbnfgA2NorPLnnsVn
         oH/U6NZoAllw/TDQ15lWeOMw96arN+UI39+rQpvDwTH5K2YaaujcDO9MDT6MmqEHZq6q
         MVocUobVfGj0pYX3kbjFPORIG1uWTzKHlxbQ4NTyJXwFuVW21vGx0OAdHkGBodmW8FiD
         VZYw==
X-Forwarded-Encrypted: i=1; AJvYcCVFr7YzHeIFu4UcwUqStY+fdnm0KhvzxHEirs0T/M7D5idLsJMgkus/75laLaEVMdMPXnW7aLpIkF5gFoVUSN7o@lists.infradead.org
X-Gm-Message-State: AOJu0YyQeoMSnQahg68B3bHfbRJ09PUb14gx1LSF565k/YVbNvEzlQPF
	B9msKVe0fIWzDO32AHFn0cRzl7jRjEQG5wKg/FPWo73HW8Qa2jVNihB/B/dXGowHPsas9XVlRJT
	k3Idq/dnQ7xim1NDRBh5z0ZoiqHPHQ7A=
X-Gm-Gg: AZuq6aIXD6uDu18LgfrB9/nCJJE8eLuASG2YLtbK0SH7c88v/FRg+EJggw8PBtzsxra
	t8NWx1WhGRGwBlR61c0/ThqNcXMAxJY+QqfoyLE8uYX2iCGqtcNTNkwU1jgipoydeVMthTJU/3I
	1vk/ZaKyKOn3IhE6Q0wZKUktXdvwIcpPL7+k1At0cRmCeEQ6KULArg0WsXk9bQbvkAM/al/gCUM
	YRQ3lxaauWyXW6GscAijENbOnOMjd6Mj6gp1XLHtxN4kzgbMOV6cy9cQjJE2Im3wTsNqycHHGNJ
	OsxlsfniXYihqwVz8dok29PxgewI
X-Received: by 2002:a17:903:2341:b0:2a1:3ad6:fab3 with SMTP id
 d9443c01a7336-2a700978ecbmr132238185ad.1.1768858408931; Mon, 19 Jan 2026
 13:33:28 -0800 (PST)
MIME-Version: 1.0
References: <20260116023611.2033078-1-nick@khadas.com>
In-Reply-To: <20260116023611.2033078-1-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Jan 2026 22:33:17 +0100
X-Gm-Features: AZwV_QhxR4hX4a4tHQP2LMf0jRGW7iOKBC1pnItltQ9JPA2FUwNRfeUXWKlm2I8
Message-ID: <CAFBinCDcyH3bFbqy4WspipzBbf-ym_1vJrTA_ecB1rP1WABG2g@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 enable eMMC storage
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_133329_882488_99F07A7E 
X-CRM114-Status: UNSURE (   9.90  )
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

On Fri, Jan 16, 2026 at 3:36=E2=80=AFAM Nick Xie <nick@khadas.com> wrote:
>
> Enable the on-board eMMC storage for Khadas VIM1S.
>
> The VIM1S features a 16GB eMMC 5.1 module. This patch adds the
> necessary regulators and the eMMC controller node.
>
> Signed-off-by: Nick Xie <nick@khadas.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

