Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF253D2F038
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0ESGWx9fnjgOGpazBly9gTrnFG61Lpa6kpmy1XSQPg=; b=ozwr+O+XSwkuVUo/XjR8ofeXA2
	qTGVrAMWLlkSMtb1yQHfFPv7FK7guFp29Xma0TDqZg28Q3oJYd9AUtxOqcpZpzG7cLEv3Pw2MJt/E
	88Q9WB8NnN6CnBgAp1llXDLasDAl9aVCmOZCJA/8TXx86HLqHwR3NlS7MaHAl8+cUMOr1W7v4LYCd
	hp0XDw1m8vC6uC5HWrZqA/ScVhsCFnyJHwRDDg8wPIhMZ4gksgOWifXhK6cy235g9LfVNKbAQ3w8/
	pOcBOD9BoXxzDZeTirkFpEtMVsSgmZK3nyf5piSdGdhrL1mxaUfvZxBDZkdN6Tk+orhdDt/ilm6Ee
	CPY5ffJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk3Q-0000000EOTB-1Jew;
	Tue, 27 Jan 2026 14:28:28 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk3D-0000000EOPf-1eha
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:28:23 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-59b6f04cae6so5967067e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 06:28:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769524093; cv=none;
        d=google.com; s=arc-20240605;
        b=iyW2cFn7qrQOTq5LfrDgkQNZ3KlB0sid/G+4fYLYqD1wAqDe7Slvl+EkijOOL6Ikhe
         6e0go92cqbznlb2NHwXtEUmV+6qejl83JoyH3eYcalMe0GL87hG4uAXeI5/L66vVCQN3
         8XX988YdKPv9FFsInqRREdX3Xwb4SMf4V3y3zptpE2w2XoLo0CTGOmUHHJo84AO9/ycu
         hEGW5QyFmeIowgMZ2K+swNpdU4EVDXWbRy4Xc7mK82ddzE4zrf2UUYv/Qv7DzOaHzpvc
         DZlPsbQKdtIRj8tkNNF/zPLMa/J/5F9Y9hBGgmRGMrbN5M+IAmvu9ev5cZzZ6FLdOKew
         PKqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t0ESGWx9fnjgOGpazBly9gTrnFG61Lpa6kpmy1XSQPg=;
        fh=Uk+Ud24MkKxSxW7D5pDbi4TC6zXbDdEKy30ohwlG/00=;
        b=e63FjVAKvHCn62LAkQyhpj93nLA3RKp8QXmxHyiXEEVaeNo+wsWyXGHhEcJpCXjHJM
         xJi5UCwdYxn4EfkkTe3TUIEGV3LjdVNp1n0kP1PBpNacwN0SVwV6OimrlTZOK0mYpcZD
         DdvhBRYNzTRDzcEJ8MAW/opykcmwP3OmVzKop4NdbyWE6yhSCzw/auwPAUGUVwHNNAcM
         85XhME8xKRRUF0u/6NOiX4+fHx3qjIMuiFfaoHGlsNq+o6q537ORi+xhixB+zmqroUt+
         l3Hhv0XhdGZntyR5zQcJzQGJb/PEAvEfMgdFd2vHtLvQ7FI+/FJBORZnRcPa/d4th+6G
         xdfA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769524093; x=1770128893; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t0ESGWx9fnjgOGpazBly9gTrnFG61Lpa6kpmy1XSQPg=;
        b=YTdEjETnTCoj+5SH6xIdE7zWa6Q+lzBWCETbORB3pr0zEaqt1GPO836yeqnVHVq5pc
         BtB6NQ1/E0v/j4SStX5nm16iO/50idicRlT5umD73+AgtOkwy4XHYIU0fOnrGoS5aWK4
         vj4PKkhQ5aYTfjvhnvIJPBw36vEccwCdK9kMN/2mYp+eZB5TPHrQTsW0CJii67DLXwsd
         eRih0PRRLvACbCr/VpzOq2E4KlYhjuAb2HL4QKA3DCxWApFlPEJ3RJezGsgPw0cuQmUH
         ibO42Y+lnk1mO6r+kmd4VKR91H3vgsAFMDsOvMj1Pd3RqakefWeQkkKNuJJ1vWHLvTyX
         C22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524093; x=1770128893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0ESGWx9fnjgOGpazBly9gTrnFG61Lpa6kpmy1XSQPg=;
        b=h/MNwWj3XVFPw3hlIz6WgZU8HZvjcpLVfBlzMpxn0j/7pKHE8i1w9edAFE3uul7TDa
         cxQuGKL6z3trc4Mn/K7an8OYjrA45kh0qKzbe6QBJ7hTtn1Be6SYtBrwznA65POABwUl
         TNtD/ohbSynk6CRtWmrOFUnDp4De3SRsSU3vm6VChc2QrK68uotHQf6DxfcMJ4UQIviC
         mTvzX7dioGpbLBrKDw1F3zZC0ozCKtJ5FFp7wnEuvIC6rGdjgksZqv9Z5nLeu6fkKwyq
         tOVaUSP7UQcuiwAjaTxSqQUIIDlPcxQjcgNVddtFXyvE93zeom6QXSqfQt7WB7OBkJd1
         eSIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBrVz+FoT6A4IwTD381JgoU8FKw/N8gejMu0S5eL0ci4+NGBdVGL5zWFMO5S8DCOkb5bXWUR2Zher9R8y6DTEO@lists.infradead.org
X-Gm-Message-State: AOJu0YzTPaooe+z1PEuLB3Oqa6Xe266W9NAYx7OHDDQdBkY9jqWOnloI
	l/V+f6syhkwl8T8WmAM6Zr5x4fq2MGQXeUFIWMLo02Ef0KTuPKFncIa6MAbwvHzj5A2lr9OXzJ1
	tVJQpnJurn/pSY7e5FecB3pQtKnYK1h11oSAljW6dnQ==
X-Gm-Gg: AZuq6aKLgHoGPITKnY2+eSOO4TR5z//wmqlm03oKsOxhhEC5QtX27GiMwl1EbSZb7lH
	1CwxbMtfzz1Cita+HBH1RHcxolMDI7/Kdlum9RA1os4PQ9L/D4ACkPdpjJIczDIQiXFZKBKSYxD
	fD8Mopne5Tp00Zqt7pLSxqwyWD6kPoiONY/8RyCTwwEwcscmtDmHla9O5FLtkg/t3JK/CpKgdEZ
	3VkA8p+vqAZWxvsNzXwwBu45bOwOCgo15+Q85LNwA8g5Lema4lGOfZxHTA3gT6QDXkYTKKT
X-Received: by 2002:a05:6512:3b11:b0:59b:9f59:c15 with SMTP id
 2adb3069b0e04-59e0402c9afmr783463e87.38.1769524092831; Tue, 27 Jan 2026
 06:28:12 -0800 (PST)
MIME-Version: 1.0
References: <20260119143121.161583-1-ulf.hansson@linaro.org>
In-Reply-To: <20260119143121.161583-1-ulf.hansson@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Jan 2026 15:27:37 +0100
X-Gm-Features: AZwV_QiV6UzbLAUygIz0HCFmYZw0hqyGypxLtdRFMO8HbScVt9PcTFuNfQK6yDw
Message-ID: <CAPDyKFqKTBXpXBqkryc1_7=nXMm2Wr+FGuDHZq-Pm4+71DM7nQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] pmdomain: core: Extend domain idle states debugfs support
To: Ulf Hansson <ulf.hansson@linaro.org>, Dhruva Gole <d-gole@ti.com>, linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_062817_792691_FB3BCC15 
X-CRM114-Status: GOOD (  12.17  )
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

On Mon, 19 Jan 2026 at 15:31, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> This small series moves around and extends the information that genpd shows for
> the domain idle states in debugs.
>
> Please help review and test!
>
> Kind regards
> Ulf Hansson
>
> Ulf Hansson (3):
>   pmdomain: core: Restructure domain idle states data for genpd in
>     debugfs
>   pmdomain: core: Show latency/residency for domain idle states in
>     debugfs
>   pmdomain: core: Extend statistics for domain idle states with s2idle
>     data
>
>  drivers/pmdomain/core.c   | 59 +++++++++++++++++++++++++++++++++------
>  include/linux/pm_domain.h |  1 +
>  2 files changed, 51 insertions(+), 9 deletions(-)
>
> --
> 2.43.0
>

FYI, the series has been applied for next!

Kind regards
Uffe

